@interface ESDObject
- (BOOL)isChart;
- (ESDObject)initWithEshObject:(EshObject *)a3;
- (ESDObject)initWithType:(unsigned __int16)a3;
- (EshObject)eshObject;
- (id)initForExcelBinaryWithType:(unsigned __int16)a3 version:(unsigned __int16)a4 state:(id)a5;
- (id)initFromReader:(OcReader *)a3 type:(unsigned __int16)a4 version:(unsigned __int16)a5;
- (id)initPBWithType:(unsigned __int16)a3 version:(unsigned __int16)a4 state:(id)a5;
- (id)parent;
- (int)shapeID;
- (void)dealloc;
- (void)eshGroup;
- (void)eshShape;
- (void)setChart:(BOOL)a3;
- (void)writeToWriter:(OcWriter *)a3;
@end

@implementation ESDObject

- (ESDObject)initWithType:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  v5 = +[ESDObjectFactory threadLocalFactory];
  v6 = -[ESDObject initWithEshObject:](self, "initWithEshObject:", [v5 createObjectWithType:v3]);

  return v6;
}

- (ESDObject)initWithEshObject:(EshObject *)a3
{
  uint64_t v3 = (ESDObject *)a3;
  if (a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)ESDObject;
    v4 = [(ESDObject *)&v6 init];
    if (v4)
    {
      v4->mEshObject = (EshObject *)v3;
      v4->mIsChart = 0;
    }
    self = v4;
    uint64_t v3 = self;
  }

  return v3;
}

- (EshObject)eshObject
{
  return self->mEshObject;
}

- (void)eshShape
{
  result = self->mEshObject;
  if (result) {
  return result;
  }
}

- (BOOL)isChart
{
  return self->mIsChart;
}

- (void)dealloc
{
  mEshObject = self->mEshObject;
  if (mEshObject) {
    (*((void (**)(EshObject *, SEL))mEshObject->var0 + 1))(mEshObject, a2);
  }
  self->mEshObject = 0;
  v4.receiver = self;
  v4.super_class = (Class)ESDObject;
  [(ESDObject *)&v4 dealloc];
}

- (id)initFromReader:(OcReader *)a3 type:(unsigned __int16)a4 version:(unsigned __int16)a5
{
  uint64_t v5 = a5;
  uint64_t v6 = a4;
  v9 = +[ESDObjectFactory threadLocalFactory];
  uint64_t v10 = [v9 createObjectWithType:v6 version:v5];

  if (!v10) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF488] format:@"Cannot create object"];
  }
  (*((void (**)(OcReader *, uint64_t))a3->var0 + 16))(a3, v10);
  v11 = [(ESDObject *)self initWithEshObject:v10];

  return v11;
}

- (id)parent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mParent);
  return WeakRetained;
}

- (void)setChart:(BOOL)a3
{
  self->mIsChart = a3;
}

- (void)writeToWriter:(OcWriter *)a3
{
  objc_super v4 = [(ESDObject *)self eshObject];
  uint64_t v5 = (void (*)(OcWriter *, EshObject *))*((void *)a3->var0 + 8);
  v5(a3, v4);
}

- (void).cxx_destruct
{
}

- (void)eshGroup
{
  result = self->mEshObject;
  if (result) {
  return result;
  }
}

- (int)shapeID
{
  uint64_t v3 = [(ESDObject *)self eshShape];
  if (v3)
  {
    objc_super v4 = (EshContentProperties *)(*(uint64_t (**)(void *))(*(void *)v3 + 168))(v3);
  }
  else
  {
    uint64_t v5 = [(ESDObject *)self eshGroup];
    objc_super v4 = (EshContentProperties *)(*(uint64_t (**)(void *))(*(void *)v5 + 136))(v5);
  }
  return EshContentProperties::getShapeID(v4);
}

- (id)initForExcelBinaryWithType:(unsigned __int16)a3 version:(unsigned __int16)a4 state:(id)a5
{
  uint64_t v5 = a4;
  uint64_t v6 = a3;
  id v8 = a5;
  v9 = (void *)[v8 xlReader];
  if (v9) {
    uint64_t v10 = (char *)v9 + *(void *)(*v9 - 24);
  }
  else {
    uint64_t v10 = 0;
  }
  id v11 = [(ESDObject *)self initFromReader:v10 type:v6 version:v5];

  return v11;
}

- (id)initPBWithType:(unsigned __int16)a3 version:(unsigned __int16)a4 state:(id)a5
{
  unsigned __int8 v5 = a4;
  uint64_t v6 = (PptObjectFactory *)a3;
  id v8 = a5;
  uint64_t v9 = [v8 reader];
  uint64_t v10 = (PptObjectFactory *)(*(uint64_t (**)(uint64_t))(*(void *)v9 + 216))(v9);
  Object = PptObjectFactory::createObject(v10, v6, v5);
  if (!Object) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF488] format:@"An object couldn't be created."];
  }
  (*(void (**)(uint64_t, EshRoot *))(*(void *)v9 + 80))(v9, Object);
  v12 = [(ESDObject *)self initWithEshObject:Object];

  return v12;
}

@end