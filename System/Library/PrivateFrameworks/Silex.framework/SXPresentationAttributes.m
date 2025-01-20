@interface SXPresentationAttributes
- (BOOL)enableViewportDebugging;
- (BOOL)fadeInComponents;
- (BOOL)isEqual:(id)a3;
- (BOOL)testingConditionEnabled;
- (BOOL)useTransparentToolbar;
- (CGSize)canvasSize;
- (NSString)contentSizeCategory;
- (SXPresentationAttributes)init;
- (double)contentScaleFactor;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)presentationMode;
- (void)setCanvasSize:(CGSize)a3;
- (void)setContentScaleFactor:(double)a3;
- (void)setContentSizeCategory:(id)a3;
- (void)setEnableViewportDebugging:(BOOL)a3;
- (void)setFadeInComponents:(BOOL)a3;
- (void)setPresentationMode:(unint64_t)a3;
- (void)setTestingConditionEnabled:(BOOL)a3;
- (void)setUseTransparentToolbar:(BOOL)a3;
@end

@implementation SXPresentationAttributes

- (SXPresentationAttributes)init
{
  v3.receiver = self;
  v3.super_class = (Class)SXPresentationAttributes;
  result = [(SXPresentationAttributes *)&v3 init];
  if (result) {
    result->_contentScaleFactor = 1.0;
  }
  return result;
}

- (unint64_t)hash
{
  objc_super v3 = [(SXPresentationAttributes *)self contentSizeCategory];
  uint64_t v4 = [v3 hash];
  unint64_t v5 = [(SXPresentationAttributes *)self presentationMode] ^ v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v7 = (SXPresentationAttributes *)a3;
  if (v7 == self)
  {
    LOBYTE(v13) = 1;
    goto LABEL_25;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    LOBYTE(v13) = 0;
    goto LABEL_25;
  }
  [(SXPresentationAttributes *)self canvasSize];
  double v9 = v8;
  double v11 = v10;
  [(SXPresentationAttributes *)v7 canvasSize];
  LOBYTE(v13) = 0;
  if (v9 == v14 && v11 == v12)
  {
    v15 = [(SXPresentationAttributes *)self contentSizeCategory];
    if (v15
      || ([(SXPresentationAttributes *)v7 contentSizeCategory],
          (objc_super v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v4 = [(SXPresentationAttributes *)self contentSizeCategory];
      unint64_t v5 = [(SXPresentationAttributes *)v7 contentSizeCategory];
      if (![v4 isEqualToString:v5])
      {
        LOBYTE(v13) = 0;
        goto LABEL_21;
      }
      int v16 = 1;
    }
    else
    {
      int v16 = 0;
    }
    unint64_t v17 = [(SXPresentationAttributes *)self presentationMode];
    if (v17 == [(SXPresentationAttributes *)v7 presentationMode]
      && (BOOL v18 = [(SXPresentationAttributes *)self fadeInComponents],
          v18 == [(SXPresentationAttributes *)v7 fadeInComponents])
      && (BOOL v19 = [(SXPresentationAttributes *)self enableViewportDebugging],
          v19 == [(SXPresentationAttributes *)v7 enableViewportDebugging])
      && (BOOL v20 = [(SXPresentationAttributes *)self testingConditionEnabled],
          v20 == [(SXPresentationAttributes *)v7 testingConditionEnabled])
      && ([(SXPresentationAttributes *)self contentScaleFactor],
          double v22 = v21,
          [(SXPresentationAttributes *)v7 contentScaleFactor],
          v22 == v23))
    {
      BOOL v24 = [(SXPresentationAttributes *)self useTransparentToolbar];
      BOOL v13 = v24 ^ [(SXPresentationAttributes *)v7 useTransparentToolbar] ^ 1;
      if ((v16 & 1) == 0) {
        goto LABEL_22;
      }
    }
    else
    {
      LOBYTE(v13) = 0;
      if (!v16)
      {
LABEL_22:
        if (!v15) {

        }
        goto LABEL_25;
      }
    }
LABEL_21:

    goto LABEL_22;
  }
LABEL_25:

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_alloc_init(SXPresentationAttributes);
  [(SXPresentationAttributes *)self canvasSize];
  -[SXPresentationAttributes setCanvasSize:](v4, "setCanvasSize:");
  unint64_t v5 = [(SXPresentationAttributes *)self contentSizeCategory];
  [(SXPresentationAttributes *)v4 setContentSizeCategory:v5];

  [(SXPresentationAttributes *)v4 setPresentationMode:[(SXPresentationAttributes *)self presentationMode]];
  [(SXPresentationAttributes *)v4 setFadeInComponents:[(SXPresentationAttributes *)self fadeInComponents]];
  [(SXPresentationAttributes *)v4 setEnableViewportDebugging:[(SXPresentationAttributes *)self enableViewportDebugging]];
  [(SXPresentationAttributes *)v4 setTestingConditionEnabled:[(SXPresentationAttributes *)self testingConditionEnabled]];
  [(SXPresentationAttributes *)self contentScaleFactor];
  -[SXPresentationAttributes setContentScaleFactor:](v4, "setContentScaleFactor:");
  [(SXPresentationAttributes *)v4 setUseTransparentToolbar:[(SXPresentationAttributes *)self useTransparentToolbar]];
  return v4;
}

- (id)description
{
  objc_super v3 = [MEMORY[0x263F089D8] string];
  [v3 appendFormat:@"<%@: %p; attributes: \n", objc_opt_class(), self];
  [(SXPresentationAttributes *)self canvasSize];
  uint64_t v4 = NSStringFromCGSize(v9);
  [v3 appendFormat:@"  canvasSize: %@; \n", v4];

  unint64_t v5 = [(SXPresentationAttributes *)self contentSizeCategory];
  [v3 appendFormat:@"  contentSizeCategory: %@; \n", v5];

  objc_msgSend(v3, "appendFormat:", @"  presentationMode: %i; \n",
    [(SXPresentationAttributes *)self presentationMode]);
  objc_msgSend(v3, "appendFormat:", @"  fadeInComponents: %i; \n",
    [(SXPresentationAttributes *)self fadeInComponents]);
  [(SXPresentationAttributes *)self contentScaleFactor];
  objc_msgSend(v3, "appendFormat:", @"  contentScaleFactor: %f; \n", v6);
  objc_msgSend(v3, "appendFormat:", @"  useTransparentToolbar: %i; \n",
    [(SXPresentationAttributes *)self useTransparentToolbar]);
  [v3 appendFormat:@">"];
  return v3;
}

- (CGSize)canvasSize
{
  double width = self->_canvasSize.width;
  double height = self->_canvasSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setCanvasSize:(CGSize)a3
{
  self->_canvasSize = a3;
}

- (NSString)contentSizeCategory
{
  return self->_contentSizeCategory;
}

- (void)setContentSizeCategory:(id)a3
{
}

- (unint64_t)presentationMode
{
  return self->_presentationMode;
}

- (void)setPresentationMode:(unint64_t)a3
{
  self->_presentationMode = a3;
}

- (BOOL)fadeInComponents
{
  return self->_fadeInComponents;
}

- (void)setFadeInComponents:(BOOL)a3
{
  self->_fadeInComponents = a3;
}

- (double)contentScaleFactor
{
  return self->_contentScaleFactor;
}

- (void)setContentScaleFactor:(double)a3
{
  self->_contentScaleFactor = a3;
}

- (BOOL)useTransparentToolbar
{
  return self->_useTransparentToolbar;
}

- (void)setUseTransparentToolbar:(BOOL)a3
{
  self->_useTransparentToolbar = a3;
}

- (BOOL)enableViewportDebugging
{
  return self->_enableViewportDebugging;
}

- (void)setEnableViewportDebugging:(BOOL)a3
{
  self->_enableViewportDebugging = a3;
}

- (BOOL)testingConditionEnabled
{
  return self->_testingConditionEnabled;
}

- (void)setTestingConditionEnabled:(BOOL)a3
{
  self->_testingConditionEnabled = a3;
}

- (void).cxx_destruct
{
}

@end