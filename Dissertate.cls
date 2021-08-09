% -------------------------------------------------------------------
%  @LaTeX-class-file{
%     filename        = "Dissertate.cls",
%     version         = "2.0",
%     date            = "25 March 2014",
%     codetable       = "ISO/ASCII",
%     keywords        = "LaTeX, Dissertate",
%     supported       = "Send email to suchow@post.harvard.edu.",
%     docstring       = "Class for a dissertation."
% --------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{Dissertate}[2014/03/25 v2.0 Dissertate Class]
\LoadClass[10pt, twoside, letterpaper]{book}

%
% Options
%
\RequirePackage{etoolbox}
\RequirePackage{pdfpages}
\RequirePackage{longtable}
\RequirePackage{lscape}
\RequirePackage{array}
\RequirePackage{ccaption}
\RequirePackage[section]{placeins}



% Line spacing: dsingle/ddouble
%   Whether to use single- or doublespacing.
\newtoggle{DissertateSingleSpace}
\togglefalse{DissertateSingleSpace}
\DeclareOption{dsingle}{
    \toggletrue{DissertateSingleSpace}
    \ClassWarning{Dissertate}{Single-spaced mode on.}
}
\DeclareOption{ddouble}{\togglefalse{DissertateSingleSpace}}

\ProcessOptions\relax

% Line Spacing
%   Define two line spacings: one for the body, and one that is more compressed.
\iftoggle{DissertateSingleSpace}{
    \newcommand{\dnormalspacing}{1.2}
    \newcommand{\dcompressedspacing}{1.0}
}{
    \newcommand{\dnormalspacing}{1.2}
    \newcommand{\dcompressedspacing}{1.0}
}

% Block quote with compressed spacing
\let\oldquote\quote
\let\endoldquote\endquote
\renewenvironment{quote}
    {\begin{spacing}{\dcompressedspacing}\oldquote}
    {\endoldquote\end{spacing}}

% Itemize with compressed spacing
\let\olditemize\itemize
\let\endolditemize\enditemize
\renewenvironment{itemize}
    {\begin{spacing}{\dcompressedspacing}\olditemize}
    {\endolditemize\end{spacing}}

% Enumerate with compressed spacing
\let\oldenumerate\enumerate
\let\endoldenumerate\endenumerate
\renewenvironment{enumerate}
    {\begin{spacing}{\dcompressedspacing}\oldenumerate}
    {\endoldenumerate\end{spacing}}

% Text layout.
% \RequirePackage[width=5.75in, letterpaper]{geometry}
% \RequirePackage[dvips=false,pdftex=false,vtex=false]{geometry}
\RequirePackage[papersize={17cm, 24cm},
                top=2.5cm,
                bottom=2.0cm,
                left=2.0cm,
                right=2.0cm]{geometry}
\usepackage{ragged2e}
\RaggedRight
\justifying
\RequirePackage{graphicx}
% \usepackage{fixltx2e}
\parindent 12pt
\RequirePackage{lettrine}
\RequirePackage{setspace}
\RequirePackage{verbatim}

\newcolumntype{C}[1]{>{\centering\arraybackslash}p{#1}}

% Fonts.
\RequirePackage{color}
\RequirePackage{xcolor}

\RequirePackage[breaklinks]{hyperref}

\RequirePackage{breakcites}
\RequirePackage{url}
\RequirePackage{amssymb}
\RequirePackage{mathspec}
% \setmathsfont(Digits,Latin,Greek)[Numbers={Proportional}]{EB Garamond}

% \setmathsfont{EB Garamond}
% \setmathrm{EB Garamond}
\AtBeginEnvironment{tabular}{\addfontfeature{RawFeature=+tnum}}
\widowpenalty=300
\clubpenalty=300
%\setromanfont[Numbers=OldStyle, Ligatures={Common, TeX}, Scale=1.0]{Manuale}
\setromanfont[Ligatures={Common, TeX}, Scale=1.0]{Manuale}
%\setromanfont{Manuale}
\newfontfamily{\smallcaps}[RawFeature={+c2sc,+scmp}]{Manuale}
\setsansfont[Scale=MatchLowercase, BoldFont={Lato Bold}]{Lato Regular}
\setmonofont[Scale=MatchLowercase]{Source Code Pro}
\RequirePackage[labelfont={bf,sf,footnotesize,singlespacing},
                textfont={sf,footnotesize,singlespacing},
                justification={justified, RaggedRight},
                singlelinecheck=false,
                margin=0pt,
                figurewithin=chapter,
                tablewithin=chapter]{caption}


                


\renewcommand{\thefootnote}{\fnsymbol{footnote}}
\RequirePackage{microtype}
\usepackage{microtype}
% Chapter thumbs
%\RequirePackage{atveryend}


% Headings and headers.`
% \renewcommand{\leftmark}{\chaptername\ \thechapter}


\RequirePackage{fancyhdr}
\RequirePackage[tiny, md, sc]{titlesec}
\setlength{\headheight}{12pt}

\newcommand{\changefont}{\fontsize{8}{10}\selectfont}

\pagestyle{fancy}
\fancyhf{}
\renewcommand{\headrulewidth}{0.0pt}
% \renewcommand*\chaptermark[1]{\markboth{\MakeUppercase{\thechapter.\ #1}}{}}
% \fancyfoot[LE,RO]{\changefont \thepage}    % Page number (boldface) in left on even
% \fancyhead[LE]{\changefont \nouppercase{\leftmark}}      % Chapter in the left on even pages
% \fancyhead[RO]{\changefont \nouppercase{\rightmark}\chaptermark}     % Section in the right on odd pages
%% Chapter name on left (even) page.
%% Section name on right (odd) page.
\fancyhead[LE]{\changefont \thepage \ \textcolor{chaptergrey}{|} \nouppercase{\leftmark}}
\fancyhead[RO]{\changefont \nouppercase{\rightmark} \textcolor{chaptergrey}{|} \thepage}


\assignpagestyle{\chapter}{empty}

\RequirePackage{titling}
% Section font
\newfontfamily\headingfont{Lato}
\titleformat*{\section}{\large\headingfont}
\titleformat*{\subsection}{\normalsize\headingfont}

% Front matter.
\setcounter{tocdepth}{1}
\usepackage[titles]{tocloft}
\usepackage[titletoc]{appendix}
\renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}}
\renewcommand{\cftchapfont}{\normalsize \scshape}
\renewcommand\listfigurename{Listing of figures}
\renewcommand\listtablename{Listing of tables}

% Endmatter
\renewcommand{\setthesection}{\arabic{chapter}.A\arabic{section}}

% References.
\renewcommand\bibname{References}
\RequirePackage[super,comma,numbers,sort&compress]{natbib}
\renewcommand{\bibnumfmt}[1]{[#1]}
\RequirePackage[palatino]{quotchap}
\renewcommand*{\chapterheadstartvskip}{\vspace{0.5\baselineskip}}
% \renewcommand{\chapterheadstartvskip}{\vspace*{-5\baselineskip}}
\renewcommand*{\chapterheadendvskip}{\vspace{2\baselineskip}}

\renewcommand\chapter{%
  \if@openright\cleardoublepage\else\clearpage\fi
  \thispagestyle{plain}%
  \global\@topnum\z@
  \@printcites% DELETED
%   \null\hfill\@printcites\par% NEW
%   \@afterindentfalse
  \secdef\@chapter\@schapter
}
\renewcommand{\@makechapterhead}[1]{%
  \chapterheadstartvskip%
%   {\size@chapter{\sectfont\raggedleft% DELETED
  {\size@chapter{\sectfont\raggedright% NEW
    {\chapnumfont
      \ifnum \c@secnumdepth >\m@ne%
      \if@mainmatter\thechapter%
      \fi\fi
      \par\nobreak}%
%     {\raggedleft\advance\leftmargin10em\interlinepenalty\@M #1\par}}% DELETED
    {\raggedright\advance\leftmargin10em\interlinepenalty\@M #1\par}}% NEW
  \nobreak\chapterheadendvskip}}

% An environment for paragraph-style section.
\providecommand\newthought[1]{%
   \addvspace{1.0\baselineskip plus 0.5ex minus 0.2ex}%
   \noindent\textsc{#1}%
}

% Align reference numbers so that they do not cause an indent.
\newlength\mybibindent
\setlength\mybibindent{0pt}
\renewenvironment{thebibliography}[1]
    {\chapter*{\bibname}%
    \thispagestyle{empty}%
     \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
     \list{\@biblabel{\@arabic\c@enumiv}}
          {\settowidth\labelwidth{\@biblabel{999}}
           \leftmargin\labelwidth
            \advance\leftmargin\dimexpr\labelsep+\mybibindent\relax\itemindent-\mybibindent
           \@openbib@code
           \usecounter{enumiv}
           \let\p@enumiv\@empty
           \renewcommand\theenumiv{\@arabic\c@enumiv}}
     \sloppy
     \clubpenalty4000
     \@clubpenalty \clubpenalty
     \widowpenalty4000%
     \sfcode`\.\@m}
    {\def\@noitemerr
      {\@latex@warning{Empty `thebibliography' environment}}
     \endlist}

% Some definitions.
\def\advisor#1{\gdef\@advisor{#1}}
\def\coadvisorOne#1{\gdef\@coadvisorOne{#1}}
\def\coadvisorTwo#1{\gdef\@coadvisorTwo{#1}}
\def\committeeInternal#1{\gdef\@committeeInternal{#1}}
\def\committeeInternalOne#1{\gdef\@committeeInternalOne{#1}}
\def\committeeInternalTwo#1{\gdef\@committeeInternalTwo{#1}}
\def\committeeExternal#1{\gdef\@committeeExternal{#1}}
\def\degreeyear#1{\gdef\@degreeyear{#1}}
\def\degreemonth#1{\gdef\@degreemonth{#1}}
\def\degreeterm#1{\gdef\@degreeterm{#1}}
\def\degree#1{\gdef\@degree{#1}}
\def\department#1{\gdef\@department{#1}}
\def\field#1{\gdef\@field{#1}}
\def\university#1{\gdef\@university{#1}}
\def\universitycity#1{\gdef\@universitycity{#1}}
\def\universitystate#1{\gdef\@universitystate{#1}}
\def\programname#1{\gdef\@programname{#1}}
\def\pdOneName#1{\gdef\@pdOneName{#1}}
\def\pdOneSchool#1{\gdef\@pdOneSchool{#1}}
\def\pdOneYear#1{\gdef\@pdOneYear{#1}}
\def\pdTwoName#1{\gdef\@pdTwoName{#1}}
\def\pdTwoSchool#1{\gdef\@pdTwoSchool{#1}}
\def\pdTwoYear#1{\gdef\@pdTwoYear{#1}}
% School name and location
\university{Harvard University}
\universitycity{Cambridge}
\universitystate{Massachusetts}


% School color found from university's graphic identity site:
% http://isites.harvard.edu/icb/icb.do?keyword=k75408&pageid=icb.page392732
\definecolor{SchoolColor}{rgb}{0.6471, 0.1098, 0.1882} % Crimson
\definecolor{chaptergrey}{rgb}{0.6471, 0.1098, 0.1882} % for chapter numbers

\hypersetup{
    colorlinks,
    citecolor=SchoolColor,
    filecolor=black,
    linkcolor=black,
    urlcolor=SchoolColor,
}

% Formatting guidelines found in:
% http://www.gsas.harvard.edu/publications/form_of_the_phd_dissertation.php
\renewcommand{\frontmatter}{
    \addtocontents{toc}{\protect\thispagestyle{empty}}
    \pagenumbering{arabic}
	\setcounter{page}{1}
    \input{frontmatter/personalize}
    \firstpage
    \copyrightpage
    \maketitle
    \promoterenpage
    \thispagestyle{empty}
    \cleartoleftpage
    \contentspage
	% \listoffigures % optional
}


\newcommand{\firstpage}{
    \newpage
    \thispagestyle{empty}
    \vspace{120pt}
    \noindent \\
    \noindent \\
    \noindent \Huge \textbf{\thetitle} \\
    \noindent \\
    \noindent \\
    \noindent \\
    \noindent \Large \theauthor\\
    \newpage
    \rm
}

\newcommand{\copyrightpage}{
	\newpage
	\thispagestyle{empty}
    \vspace*{\fill}
    \noindent \small The research presented in this thesis was performed at the Department of Tumor Immunology at the Radboud Institute for Molecular Life Sciences, Radboud University Medical Center, Nijmegen, The Netherlands. The research presented in this thesis was financially supported by an NWO Vidi grant. \\
    \noindent \\
    \noindent \textbf{ISBN} \\
    \noindent 1234567890123 \\
    \noindent \\
    \noindent \textbf{Design} \\
    \noindent P.T.A. Linders \\
    \noindent \\
    \noindent \textbf{Print} \\
    \noindent Proefschrift AIO (proefschrift-aio.nl) \\
    \noindent \\
    \noindent \\
	\scshape \noindent \small \textbf{\copyright \small 2021\hspace{3pt}-- \theauthor} \\
	\noindent All rights reserved. No part of this book may be reproduced, distributed, stored in a retrieval system or transmitted in any form or by any means, without prior written permission by the author. \\
	% \vspace*{\fill}
	\newpage
	\rm
}

\renewcommand{\maketitle}{
	\thispagestyle{empty}
	\vspace*{\fill}
	\vspace{10pt}
	\begin{center}
	\Huge {\thetitle} \normalsize \\
    \vspace{100pt}
    \large \textbf{Proefschrift} \normalsize \\
    \vspace{50pt}
    \textsc{ter verkrijging van de graad van doctor\\
    aan de Radboud Universiteit Nijmegen\\
    op gezag van de rector magnificus prof. dr. J.H.J.M. van Krieken,\\
    volgens besluit van het college van decanen\\
    in het openbaar te verdedigen op vrijdag 1 oktober 2021\\
    om 16.30 uur precies\\
    \vspace{20pt}
    door\\
    \vspace{20pt}}
    \large \textbf{\theauthor} \normalsize \\
    \vspace{12pt}
    geboren op 28 april 1993\\
    te Oss
	\end{center} \vspace*{\fill}
}

\newcommand{\promoterenpage}{
    \newpage
    \thispagestyle{empty}
    \vspace{120pt}
    \noindent \textbf{Promotoren}\\
    \noindent Prof. dr. Geert van den Bogaart (Rijksuniversiteit Groningen)\\
    \noindent Prof. dr. Dirk J. Lefeber\\
    \noindent \\
    \noindent \textbf{Copromotor}\\
    \noindent Dr. Martin ter Beest\\
    \noindent \\
    \noindent \textbf{Manuscriptcommissie}\\
    \noindent Prof. dr. Alessandra Cambi (voorzitter)\\
    \noindent Prof. dr. Ody C.M. Sibon (Rijksuniversiteit Groningen)\\
    \noindent Dr. ir. Ruben Bierings (Erasmus Medisch Centrum Rotterdam)
    \clearpage
    \rm
}

\newcommand{\contentspage}{
    \thispagestyle{empty}    
    \pdfbookmark{\contentsname}{Contents}
    \@openrightfalse
    \tableofcontents
    \@openrighttrue
    \thispagestyle{empty}
    \clearpage
}

\newcommand{\abstractpage}{
    \pdfbookmark{Abstract}{Abstract}
	\newpage
	\pagenumbering{roman}
	\setcounter{page}{3}
	\pagestyle{fancy}
	\lhead{Thesis advisor: Professor \@advisor} \rhead{\@author}
	\vspace*{35pt}
	\begin{center}
    	\Large \textcolor{SchoolColor}{\@title} \normalsize \\
    	\vspace*{20pt}
    	\scshape Abstract \\ \rm
	\end{center}
    \begin{spacing}{\dnormalspacing}
    	\input{frontmatter/abstract}
    \end{spacing}
	\vspace*{\fill}
	\newpage \lhead{} \rhead{}
	% \cfoot{\thepage}
}



\newcommand{\dedicationpage}{
    \cleardoublepage
    \phantomsection
    \pdfbookmark{Dedication}{Dedication}
	\newpage \thispagestyle{fancy} \vspace*{\fill}
	\scshape \noindent \input{frontmatter/dedication}
	\vspace*{\fill} \newpage \rm
    \cleardoublepage
}

\newcommand{\acknowledgments}{
	\chapter*{Acknowledgments}
	\noindent
    \begin{spacing}{\dnormalspacing}
    	\input{frontmatter/thanks}
    \end{spacing}
	\vspace*{\fill} \newpage
	\setcounter{page}{1}
	\pagenumbering{arabic}
}


\renewcommand{\backmatter}{
    % \begin{appendices}
    %     \include{chapters/appendixA}
    % \end{appendices}
    \input{endmatter/personalize}
    \clearpage
    \begin{spacing}{\dcompressedspacing}
        \footnotesize
        \bibliography{references}
        \addcontentsline{toc}{chapter}{References}
        \bibliographystyle{naturemag}
       % \include{endmatter/colophon}
    \end{spacing}
}

% \usepackage[height={2cm},distance={2mm},topthumbmargin={auto},bottomthumbmargin={auto}]{thumbs}
\usepackage[thumblink=rule,linefill=dots,height={auto},minheight={48pt},
    width={10mm},distance={6mm},topthumbmargin={auto},bottomthumbmargin={auto},
    eventxtindent={12.3pt},oddtxtexdent={7.6pt},
    evenmarkindent={-3mm},oddmarkexdent={-3mm},evenprintvoffset={0pt},
    nophantomsection=true,ignorehoffset=false,ignorevoffset=false,final=true,
    hidethumbs=false,verbose=true]{thumbs}

\usepackage[cam,a4,center,dvips]{crop}


\usepackage{pagecolor}

\makeatletter
\def\cleartoleftpage{\clearpage\if@twoside \ifodd\c@page
\hbox{}\newpage\if@twocolumn\hbox{}\newpage\fi\fi\fi}
\makeatother