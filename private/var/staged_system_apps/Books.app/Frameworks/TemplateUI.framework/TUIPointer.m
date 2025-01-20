@interface TUIPointer
+ (TUIPointer)pointerWithRefId:(id)a3 style:(id)a4;
- (NSString)refId;
- (TUIPointer)initWithRefId:(id)a3 style:(id)a4;
- (TUIPointerStyle)style;
@end

@implementation TUIPointer

- (TUIPointer)initWithRefId:(id)a3 style:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TUIPointer;
  v8 = [(TUIPointer *)&v12 init];
  if (v8)
  {
    v9 = (NSString *)[v6 copy];
    refId = v8->_refId;
    v8->_refId = v9;

    objc_storeStrong((id *)&v8->_style, a4);
  }

  return v8;
}

+ (TUIPointer)pointerWithRefId:(id)a3 style:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6 && [v6 length]) {
    id v8 = [objc_alloc((Class)a1) initWithRefId:v6 style:v7];
  }
  else {
    id v8 = 0;
  }

  return (TUIPointer *)v8;
}

- (NSString)refId
{
  return self->_refId;
}

- (TUIPointerStyle)style
{
  return self->_style;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_style, 0);

  objc_storeStrong((id *)&self->_refId, 0);
}

@end