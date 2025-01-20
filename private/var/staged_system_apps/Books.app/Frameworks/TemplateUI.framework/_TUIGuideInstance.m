@interface _TUIGuideInstance
- (NSString)description;
- (TUIGuideSpec)spec;
- (_TUIGuideInstance)initWithSpec:(id)a3;
- (double)guideOffset;
- (double)offset;
- (void)setOffset:(double)a3;
@end

@implementation _TUIGuideInstance

- (_TUIGuideInstance)initWithSpec:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_TUIGuideInstance;
  v6 = [(_TUIGuideInstance *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_spec, a3);
    v7->_offset = NAN;
  }

  return v7;
}

- (double)guideOffset
{
  return self->_offset;
}

- (NSString)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  id v5 = +[NSString stringWithFormat:@"<%@ %p spec=%@ offset=%f>", v4, self, self->_spec, *(void *)&self->_offset];

  return (NSString *)v5;
}

- (double)offset
{
  return self->_offset;
}

- (void)setOffset:(double)a3
{
  self->_offset = a3;
}

- (TUIGuideSpec)spec
{
  return self->_spec;
}

- (void).cxx_destruct
{
}

@end