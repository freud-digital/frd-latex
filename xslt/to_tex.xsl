<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output media-type="text" omit-xml-declaration="yes"/>
    <xsl:template match="/">
        \documentclass[twoside=true,titlepage=false,open=any, parskip=never, fontsize=10pt, headings=small, chapterprefix=false, appendixprefix=false]{scrbook}
        \addtolength{\oddsidemargin}{\evensidemargin}
        \setlength{\oddsidemargin}{.5\oddsidemargin}
        \setlength{\evensidemargin}{\oddsidemargin}
        \usepackage[paperheight=230mm, paperwidth=138mm, textwidth=100mm, textheight=185mm]{geometry}
        
        \usepackage{scrlayer-scrpage}
        \usepackage{hyphenat}
        \usepackage{fontspec}
        \usepackage{moresize}
        %\usepackage{ipa}
        \usepackage[english, ngerman]{babel}
        \usepackage[babel]{microtype}
        \usepackage{soul}
        \usepackage{scrhack}
        \usepackage{xpatch}
        \usepackage[nonewpage]{indextools}
        \usepackage{lettrine}
        \usepackage[series={A,B,C}]{reledmac}
        
        \setmainfont[Path=./fonts/,
        Extension=.ttf,
        UprightFont=*-Roman,
        BoldFont=*-Bold,
        ItalicFont=*-Italic,
        BoldItalicFont=*-BoldItalic]{Brill}
        
        \KOMAoptions{toc=chapterentrydotfill, toc=flat}
        \addtokomafont{chapterentrypagenumber}{\mdseries}
        \setkomafont{chapterentry}{\normalfont\mdseries}
        \setkomafont{partentry}{\normalfont\mdseries}
        \RedeclareSectionCommand[tocbeforeskip=0pt]{chapter}         
        
        \setlength{\skip\footins}{4mm plus 2mm} % Abstand Fussnote Text
        \interfootnotelinepenalty=10000 % Kein Seitenwechsel in Fuss
        
        %% Sperrung (Package Soul)
        %% Hier ist die Sperrung definiert. Sperrung erreicht man mit \so{gesperrtes Wort}
        \sodef\so{}{.14em}{.4em plus.1em minus .1em}{.4em plus.1em minus .1em}
        
        
        
        % Fußnoten linksbündig
        \deffootnote{1.5em}{1em}{% 
        \makebox[1.5em][l]{\thefootnotemark}%
        }
        
        
        % Fussnotenlineal (wobei für reledmac wohl was anderes gilt)
        \let\normalfootnoterule\footnoterule
        \setfootnoterule{0pt}
        \let\normalfootnoterule\footnoterule
        
        
        \setlength{\skip\footins}{8mm plus 2mm} % Abstand Fussnote Text
        \interfootnotelinepenalty=10000 % Kein Seitenwechsel in Fuss
        
        %% Kapitelüberschriften
        \renewcommand*{\raggedchapter}{\centering} 
        \renewcommand*{\raggedsection}{%
        \CenteringLeftskip=1cm plus 1em\relax 
        \CenteringRightskip=1cm plus 1em\relax 
        \Centering\footnotesize\thesection{}.\ }
        \setkomafont{section}{\footnotesize}
        \setkomafont{chapter}{\normalfont\Large}
        \renewcommand{\chapterpagestyle}{empty}%The first page in each chapter won't have any heading or footer, especially no page number
        
        % section ohne führende Kapitelnummer
        \renewcommand*\thesection{\arabic{section}}
        
        % Bildunterschrift ohne Nummer
        \renewcommand*{\figureformat}{}
        \renewcommand*{\captionformat}{}
        
        %% Zeilennummern
        \firstlinenum{0} \linenumincrement{5}
        \lineation{section} %Jeder Abschnitt wird durchnummeriert
        \renewcommand{\numlabfont}{\ssmall} %Schriftgröße Zeilennummern
        
        
        \newcommand{\Theight}{\dimexpr\fontcharht\font`W}
        \newcommand{\pbposition}{\depth}
        \newcommand{\pb}{\nobreak\hspace{0pt}\raisebox{-0.1em}{\raisebox{\pbposition}{\textnormal{HANSI4EVER}}}\nobreak\hspace{0pt}}
        
        \renewcaptionname{ngerman}{\contentsname}{Inhalt}           %Table of contents
        
        % FUSSNOTE
        %% Im Apparat f. und ff.
        \Xtwolines{f.}
        \Xtwolinesbutnotmore
        
        %% Zeilennummerierung Abstand zum Lemma
        \Xboxlinenum{5mm}
        
        %% Bei zwei Apparateinträgen in einer Zeile wird nur beim ersten Mal die Zeile gezählt
        \Xnumberonlyfirstinline
        \Xnumberonlyfirstintwolines
        \Xinplaceofnumber{1em}
        \Xhangindent{1em}
        
        % ENDNOTEN
        \Xendbeforepagenumber{} 
        \Xendparagraph[A]
        \Xendsep{}
        \Xendafterpagenumber[A]{, }
        \Xendnotenumfont[A]{\tiny}
        \Xendlineprefixsingle[A]{\tiny}
        \Xendlineprefixmore[A]{\tiny}
        \Xendhangindent[A]{4em}
        
        \Xendboxlinenum[A]{0em}
        \Xendlemmaseparator{$\rbracket$}
        \Xendnotefontsize[A]{\footnotesize}
        \Xendhangindent[A]{0em}
        \Xendlemmafont[A]{\normalfont}
        \Xendlemmafont[B]{\bfseries}
        \Xendnotefontsize[B]{\footnotesize}
        \Xendnotenumfont{\footnotesize}
        \Xendlineprefixsingle[C]{\tiny}
        \Xendlineprefixmore[C]{\tiny}
        \Xendlemmadisablefontselection
        \Xendlemmafont{\itshape}
        \Xendlinerangeseparator{\tiny{--}}
        \Xendhangindent{4em}
        \Xendboxlinenum{3.6em}
        \Xendafternumber{0.4em}
        \Xendboxlinenumalign{R}
        
        \makeindex[name=kw,title=Schlagworteregister,columns=2]
        \makeindex[name=person,title=Personenregister,columns=2]
        
        \begin{document}

        \beginnumbering
        <xsl:for-each select=".//tei:body/tei:div"><xsl:apply-templates/></xsl:for-each>
        \endnumbering
  
        \section*{Kritischer Apparat}
        \doendnotes{A}
        
        \section*{Stellenkommentar}
        \doendnotes{B}
        
        \printindex[person]
        \printindex[kw]
        


        \end{document}
    </xsl:template>
    
    <xsl:template match="tei:p[(@rend='h1')]">
        <xsl:text>\pstart</xsl:text>
        <xsl:text>\eledsection*{</xsl:text><xsl:apply-templates/><xsl:text>}</xsl:text>
        <xsl:text>\pend</xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:p[not(@rend='h1')]">
        \pstart
        <xsl:apply-templates/>
        \pend
    </xsl:template>
    <xsl:template match="tei:app[not(ancestor::tei:note)]">
        <xsl:variable name="listWit" select="root()//tei:listWit" as="node()"/>
        <xsl:text>\edtext{</xsl:text><xsl:apply-templates select="./tei:lem"/>}<xsl:text>{\lemma{\textbf{</xsl:text><xsl:apply-templates select="./tei:lem"/><xsl:text>}}\Aendnote{</xsl:text><xsl:for-each select=".//tei:rdg"><xsl:variable name="witIds">
            <xsl:value-of select="string-join(./@wit, ' ')"/>
        </xsl:variable>
            <xsl:variable name="witLabels">
                <xsl:for-each select="tokenize($witIds, ' ')">
                    <xsl:variable name="witId">
                        <xsl:value-of select="substring-after(., '#')"/>
                    </xsl:variable>
                    <xsl:value-of select="$listWit//tei:witness[@xml:id=$witId]/tei:idno/text()"/>
                </xsl:for-each>
            </xsl:variable><xsl:apply-templates select="."/><xsl:text> </xsl:text><xsl:for-each select="$witLabels"><xsl:value-of select="."/><xsl:text> </xsl:text></xsl:for-each></xsl:for-each><xsl:text>}}</xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:app[ancestor::tei:note]">
        <xsl:variable name="listWit" select="root()//tei:listWit" as="node()"/>
        \toendnotes[A]{{\thepage} Fußnote <xsl:apply-templates select="./tei:lem"/>}{\lemma{\textbf{<xsl:apply-templates select="./tei:lem"/>}}{<xsl:for-each select=".//tei:rdg"><xsl:variable name="witIds">
            <xsl:value-of select="string-join(./@wit, ' ')"/>
        </xsl:variable>
            <xsl:variable name="witLabels">
                <xsl:for-each select="tokenize($witIds, ' ')">
                    <xsl:variable name="witId">
                        <xsl:value-of select="substring-after(., '#')"/>
                    </xsl:variable>
                    <xsl:value-of select="$listWit//tei:witness[@xml:id=$witId]/tei:idno/text()"/>
                </xsl:for-each>
            </xsl:variable><xsl:apply-templates select="."/><xsl:text> </xsl:text><xsl:for-each select="$witLabels"><xsl:value-of select="."/><xsl:text> </xsl:text></xsl:for-each></xsl:for-each>}}
    </xsl:template>
    <xsl:template match="tei:note[@type='e']">\edtext{}{\Bendnote{<xsl:apply-templates/>}}
    </xsl:template>
    
    <xsl:template match="tei:note[@type='footnote']">
        \footnote{<xsl:apply-templates/>}
    </xsl:template>
    
    <xsl:template match="tei:term">\textbf{<xsl:value-of select="."/>}</xsl:template>
    <xsl:template match="tei:fw"/>
    
    <xsl:template match="tei:rs[starts-with(@ref, '#frd_kw')]"><xsl:value-of select="."/>\edindex[kw]{<xsl:value-of select="replace(@ref, '#frd_kw_', 'Schlagwort Nr. ')"/>}</xsl:template>
    
    <xsl:template match="tei:rs[starts-with(@ref, '#frd_person')]"><xsl:value-of select="."/>\edindex[person]{<xsl:value-of select="replace(@ref, '#frd_person_', 'Person Nr. ')"/>}</xsl:template>
    
    <!--<xsl:template match="tei:pb">
        <xsl:text>{\pb}</xsl:text>
    </xsl:template>-->
    
</xsl:stylesheet>