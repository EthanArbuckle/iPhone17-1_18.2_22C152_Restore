@interface PXGEngineDeferRenderEventSerializable
- (BOOL)delegateAllowsRender;
- (BOOL)shouldDeferRenderUntilNextFrame;
- (PXGEngineDeferRenderEventSerializable)initWithSerializableObject:(id)a3;
- (id)createSerializableObject;
- (void)setDelegateAllowsRender:(BOOL)a3;
- (void)setShouldDeferRenderUntilNextFrame:(BOOL)a3;
@end

@implementation PXGEngineDeferRenderEventSerializable

- (void)setDelegateAllowsRender:(BOOL)a3
{
  self->_delegateAllowsRender = a3;
}

- (BOOL)delegateAllowsRender
{
  return self->_delegateAllowsRender;
}

- (void)setShouldDeferRenderUntilNextFrame:(BOOL)a3
{
  self->_shouldDeferRenderUntilNextFrame = a3;
}

- (BOOL)shouldDeferRenderUntilNextFrame
{
  return self->_shouldDeferRenderUntilNextFrame;
}

- (id)createSerializableObject
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v9[0] = @"shouldDeferRenderUntilNextFrame";
  BOOL v3 = [(PXGEngineDeferRenderEventSerializable *)self shouldDeferRenderUntilNextFrame];
  v4 = [NSNumber numberWithBool:v3];
  v9[1] = @"delegateAllowsRender";
  v10[0] = v4;
  BOOL v5 = [(PXGEngineDeferRenderEventSerializable *)self delegateAllowsRender];
  v6 = [NSNumber numberWithBool:v5];
  v10[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];

  return v7;
}

- (PXGEngineDeferRenderEventSerializable)initWithSerializableObject:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PXGEngineDeferRenderEventSerializable;
  BOOL v5 = [(PXGEngineDeferRenderEventSerializable *)&v12 init];
  if (v5)
  {
    id v6 = v4;
    id v7 = [v6 objectForKeyedSubscript:@"shouldDeferRenderUntilNextFrame"];
    char v8 = [v7 BOOLValue];

    v5->_shouldDeferRenderUntilNextFrame = v8;
    v9 = [v6 objectForKeyedSubscript:@"delegateAllowsRender"];

    id v10 = v9;
    LOBYTE(v9) = [v10 BOOLValue];

    v5->_delegateAllowsRender = (char)v9;
  }

  return v5;
}

@end