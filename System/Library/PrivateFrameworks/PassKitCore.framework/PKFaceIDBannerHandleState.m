@interface PKFaceIDBannerHandleState
+ (BOOL)supportsSecureCoding;
+ (id)createForGlyphState:(int64_t)a3;
- (PKFaceIDBannerHandleState)initWithCoder:(id)a3;
- (int64_t)glyphState;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKFaceIDBannerHandleState

+ (id)createForGlyphState:(int64_t)a3
{
  id result = [PKFaceIDBannerHandleState alloc];
  if (result)
  {
    v5.receiver = result;
    v5.super_class = (Class)PKBannerHandleState;
    id result = objc_msgSendSuper2(&v5, sel_init);
    if (result) {
      *((void *)result + 1) = 1;
    }
  }
  *((void *)result + 2) = a3;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKFaceIDBannerHandleState)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PKFaceIDBannerHandleState;
  objc_super v5 = [(PKBannerHandleState *)&v7 initWithCoder:v4];
  if (v5) {
    v5->_glyphState = [v4 decodeIntegerForKey:@"glyphState"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKFaceIDBannerHandleState;
  id v4 = a3;
  [(PKBannerHandleState *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_glyphState, @"glyphState", v5.receiver, v5.super_class);
}

- (int64_t)glyphState
{
  return self->_glyphState;
}

@end