@interface _PXStoryPacingControllerChangeOrigin
- (_PXStoryPacingControllerChangeOrigin)initWithDescription:(id)a3;
- (id)description;
@end

@implementation _PXStoryPacingControllerChangeOrigin

- (void).cxx_destruct
{
}

- (id)description
{
  return self->_description;
}

- (_PXStoryPacingControllerChangeOrigin)initWithDescription:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_PXStoryPacingControllerChangeOrigin;
  v6 = [(_PXStoryPacingControllerChangeOrigin *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_description, a3);
  }

  return v7;
}

@end