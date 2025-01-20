@interface PSFooterMultiHyperlinkViewLinkSpec
+ (id)specWithRange:(_NSRange)a3 target:(id)a4 action:(SEL)a5;
+ (id)specWithRange:(_NSRange)a3 url:(id)a4;
- (NSURL)URL;
- (SEL)action;
- (_NSRange)linkRange;
- (id)target;
- (void)setAction:(SEL)a3;
- (void)setLinkRange:(_NSRange)a3;
- (void)setTarget:(id)a3;
- (void)setURL:(id)a3;
@end

@implementation PSFooterMultiHyperlinkViewLinkSpec

+ (id)specWithRange:(_NSRange)a3 url:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v6 = a4;
  v7 = objc_alloc_init(PSFooterMultiHyperlinkViewLinkSpec);
  -[PSFooterMultiHyperlinkViewLinkSpec setLinkRange:](v7, "setLinkRange:", location, length);
  [(PSFooterMultiHyperlinkViewLinkSpec *)v7 setURL:v6];

  return v7;
}

+ (id)specWithRange:(_NSRange)a3 target:(id)a4 action:(SEL)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v8 = a4;
  v9 = objc_alloc_init(PSFooterMultiHyperlinkViewLinkSpec);
  -[PSFooterMultiHyperlinkViewLinkSpec setLinkRange:](v9, "setLinkRange:", location, length);
  [(PSFooterMultiHyperlinkViewLinkSpec *)v9 setTarget:v8];

  [(PSFooterMultiHyperlinkViewLinkSpec *)v9 setAction:a5];
  return v9;
}

- (_NSRange)linkRange
{
  NSUInteger length = self->_linkRange.length;
  NSUInteger location = self->_linkRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setLinkRange:(_NSRange)a3
{
  self->_linkRange = a3;
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
}

- (id)target
{
  id WeakRetained = objc_loadWeakRetained(&self->_target);
  return WeakRetained;
}

- (void)setTarget:(id)a3
{
}

- (SEL)action
{
  if (self->_action) {
    return self->_action;
  }
  else {
    return 0;
  }
}

- (void)setAction:(SEL)a3
{
  if (a3) {
    v3 = a3;
  }
  else {
    v3 = 0;
  }
  self->_action = v3;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_target);
  objc_storeStrong((id *)&self->_URL, 0);
}

@end