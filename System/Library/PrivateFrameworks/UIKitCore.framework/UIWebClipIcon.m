@interface UIWebClipIcon
- (BOOL)isPrecomposed;
- (BOOL)isSiteWide;
- (CGSize)bestSize;
- (NSURL)url;
- (int64_t)compare:(id)a3 preferringDeviceIconSizes:(BOOL)a4;
- (void)setBestSize:(CGSize)a3;
- (void)setPrecomposed:(BOOL)a3;
- (void)setSiteWide:(BOOL)a3;
- (void)setUrl:(id)a3;
@end

@implementation UIWebClipIcon

- (int64_t)compare:(id)a3 preferringDeviceIconSizes:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (-[UIWebClipIcon isSiteWide](self, "isSiteWide") && ![v6 isSiteWide]) {
    goto LABEL_14;
  }
  if (!-[UIWebClipIcon isSiteWide](self, "isSiteWide") && ([v6 isSiteWide] & 1) != 0) {
    goto LABEL_15;
  }
  if (!v4)
  {
    [(UIWebClipIcon *)self bestSize];
    double v16 = v15;
    [v6 bestSize];
    if (v16 > v17) {
      goto LABEL_15;
    }
    [(UIWebClipIcon *)self bestSize];
    double v19 = v18;
    [v6 bestSize];
    if (v19 >= v20)
    {
LABEL_10:
      if (!-[UIWebClipIcon isPrecomposed](self, "isPrecomposed") || [v6 isPrecomposed])
      {
        if (-[UIWebClipIcon isPrecomposed](self, "isPrecomposed") || ([v6 isPrecomposed] & 1) == 0)
        {
          int64_t v14 = 0;
          goto LABEL_16;
        }
        goto LABEL_14;
      }
LABEL_15:
      int64_t v14 = 1;
      goto LABEL_16;
    }
LABEL_14:
    int64_t v14 = -1;
    goto LABEL_16;
  }
  v7 = (void *)MEMORY[0x1E4F22478];
  [(UIWebClipIcon *)self bestSize];
  double v9 = v8;
  double v11 = v10;
  [v6 bestSize];
  int64_t v14 = objc_msgSend(v7, "_compareApplicationIconCanvasSize:withSize:", v9, v11, v12, v13);
  if (!v14) {
    goto LABEL_10;
  }
LABEL_16:

  return v14;
}

- (BOOL)isPrecomposed
{
  return self->_precomposed;
}

- (void)setPrecomposed:(BOOL)a3
{
  self->_precomposed = a3;
}

- (BOOL)isSiteWide
{
  return self->_siteWide;
}

- (void)setSiteWide:(BOOL)a3
{
  self->_siteWide = a3;
}

- (CGSize)bestSize
{
  double width = self->_bestSize.width;
  double height = self->_bestSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setBestSize:(CGSize)a3
{
  self->_bestSize = a3;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (void).cxx_destruct
{
}

@end