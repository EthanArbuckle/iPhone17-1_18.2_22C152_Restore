@interface _DUIPreviewAndImageComponentUpdate
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFromSource;
- (_DUIPreviewAndImageComponentUpdate)initWithCoder:(id)a3;
- (_DUIPreviewAndImageComponentUpdate)initWithPreviewAndImageComponent:(id)a3 isFromSource:(BOOL)a4;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setIsFromSource:(BOOL)a3;
@end

@implementation _DUIPreviewAndImageComponentUpdate

- (_DUIPreviewAndImageComponentUpdate)initWithPreviewAndImageComponent:(id)a3 isFromSource:(BOOL)a4
{
  v6.receiver = self;
  v6.super_class = (Class)_DUIPreviewAndImageComponentUpdate;
  result = [(_DUIPreviewAndImageComponent *)&v6 initWithPreviewAndImageComponent:a3];
  if (result) {
    result->_isFromSource = a4;
  }
  return result;
}

- (_DUIPreviewAndImageComponentUpdate)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_DUIPreviewAndImageComponentUpdate;
  v5 = [(_DUIPreviewAndImageComponent *)&v7 initWithCoder:v4];
  if (v5) {
    v5->_isFromSource = [v4 decodeBoolForKey:@"isFromSource"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_DUIPreviewAndImageComponentUpdate;
  id v4 = a3;
  [(_DUIPreviewAndImageComponent *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", self->_isFromSource, @"isFromSource", v5.receiver, v5.super_class);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && self->_isFromSource == v4[32])
  {
    v7.receiver = self;
    v7.super_class = (Class)_DUIPreviewAndImageComponentUpdate;
    BOOL v5 = [(_DUIPreviewAndImageComponent *)&v7 isEqual:v4];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  BOOL isFromSource = self->_isFromSource;
  v4.receiver = self;
  v4.super_class = (Class)_DUIPreviewAndImageComponentUpdate;
  return [(_DUIPreviewAndImageComponent *)&v4 hash] ^ isFromSource;
}

- (BOOL)isFromSource
{
  return self->_isFromSource;
}

- (void)setIsFromSource:(BOOL)a3
{
  self->_BOOL isFromSource = a3;
}

@end