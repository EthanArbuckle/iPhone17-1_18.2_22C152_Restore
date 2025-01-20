@interface _UIStoryboardProxy
+ (BOOL)supportsSecureCoding;
- (_UIStoryboardProxy)initWithCoder:(id)a3;
- (_UIStoryboardProxy)initWithStoryboard:(id)a3;
- (id)description;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _UIStoryboardProxy

- (_UIStoryboardProxy)initWithStoryboard:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIStoryboardProxy;
  v4 = [(_UIStoryboardProxy *)&v6 init];
  if (v4)
  {
    if (a3)
    {
      v4->_storyboard = (UIStoryboard *)a3;
    }
    else
    {
      if (_UIStateRestorationDebugLogEnabled()) {
        NSLog(&cfstr_SWarningTriedT.isa, "-[_UIStoryboardProxy initWithStoryboard:]", 0);
      }
      return 0;
    }
  }
  return v4;
}

- (_UIStoryboardProxy)initWithCoder:(id)a3
{
  uint64_t v5 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"kStoryboardNameKey"];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"kStoryboardBundlePathKey"];
    if (v7) {
      uint64_t v8 = [MEMORY[0x1E4F28B50] bundleWithPath:v7];
    }
    else {
      uint64_t v8 = 0;
    }
    v11 = +[UIStoryboard storyboardWithName:v6 bundle:v8];
  }
  else
  {
    if (_UIStateRestorationDebugLogEnabled()) {
      NSLog(&cfstr_SNoStoryboardN.isa, "-[_UIStoryboardProxy initWithCoder:]", self);
    }
    v11 = 0;
  }
  v9 = self;
  return (_UIStoryboardProxy *)v11;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v5 = [(UIStoryboard *)self->_storyboard name];
  if (v5)
  {
    [a3 encodeObject:v5 forKey:@"kStoryboardNameKey"];
    uint64_t v6 = [(UIStoryboard *)self->_storyboard bundle];
    if (v6)
    {
      uint64_t v7 = v6;
      if (v6 != (NSBundle *)[MEMORY[0x1E4F28B50] mainBundle])
      {
        uint64_t v8 = [(NSBundle *)v7 bundlePath];
        if (v8)
        {
          [a3 encodeObject:v8 forKey:@"kStoryboardBundlePathKey"];
        }
        else if (_UIStateRestorationDebugLogEnabled())
        {
          NSLog(&cfstr_SStoryboardBun.isa, "-[_UIStoryboardProxy encodeWithCoder:]", v7);
        }
      }
    }
  }
  else if (_UIStateRestorationDebugLogEnabled())
  {
    NSLog(&cfstr_SStoryboardHas.isa, "-[_UIStoryboardProxy encodeWithCoder:]", self->_storyboard);
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"%s<%p>: %@", object_getClassName(self), self, self->_storyboard];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_UIStoryboardProxy;
  [(_UIStoryboardProxy *)&v3 dealloc];
}

@end