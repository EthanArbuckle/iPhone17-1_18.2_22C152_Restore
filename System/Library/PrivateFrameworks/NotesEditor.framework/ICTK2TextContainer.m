@interface ICTK2TextContainer
- (BOOL)inPreviewMode;
- (BOOL)insideSiriSnippet;
- (BOOL)insideSystemPaper;
- (BOOL)isSimpleRectangularTextContainer;
- (ICLinkMenuDelegate)linkDelegate;
- (ICTK2TextView)tk2TextView;
- (id)layoutManager;
- (void)setInPreviewMode:(BOOL)a3;
- (void)setInsideSiriSnippet:(BOOL)a3;
- (void)setInsideSystemPaper:(BOOL)a3;
- (void)setLinkDelegate:(id)a3;
- (void)setTk2TextView:(id)a3;
@end

@implementation ICTK2TextContainer

- (ICTK2TextView)tk2TextView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tk2TextView);

  return (ICTK2TextView *)WeakRetained;
}

- (BOOL)insideSiriSnippet
{
  return self->_insideSiriSnippet;
}

- (void)setLinkDelegate:(id)a3
{
  self->_linkDelegate = (ICLinkMenuDelegate *)a3;
}

- (void)setInsideSystemPaper:(BOOL)a3
{
  self->_insideSystemPaper = a3;
}

- (void)setInsideSiriSnippet:(BOOL)a3
{
  self->_insideSiriSnippet = a3;
}

- (BOOL)isSimpleRectangularTextContainer
{
  v3 = [(ICTK2TextContainer *)self exclusionPaths];
  if ([v3 count] || -[ICTK2TextContainer maximumNumberOfLines](self, "maximumNumberOfLines")) {
    LOBYTE(v4) = 0;
  }
  else {
    BOOL v4 = ![(ICTK2TextContainer *)self inPreviewMode];
  }

  return v4;
}

- (BOOL)inPreviewMode
{
  return self->_inPreviewMode;
}

- (BOOL)insideSystemPaper
{
  return self->_insideSystemPaper;
}

- (void)setTk2TextView:(id)a3
{
}

- (id)layoutManager
{
  return 0;
}

- (void)setInPreviewMode:(BOOL)a3
{
  self->_inPreviewMode = a3;
}

- (ICLinkMenuDelegate)linkDelegate
{
  return self->_linkDelegate;
}

- (void).cxx_destruct
{
}

@end