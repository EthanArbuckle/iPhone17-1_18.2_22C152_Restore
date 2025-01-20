@interface _UIOMenuPreparationResponse
- (UIMenu)preparedMenu;
- (_UIOMenuPreparationResponse)initWithPreparedMenu:(id)a3;
- (void)setPreparedMenu:(id)a3;
@end

@implementation _UIOMenuPreparationResponse

- (_UIOMenuPreparationResponse)initWithPreparedMenu:(id)a3
{
  v5 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:0];
  if (!v5)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"_UIOMenuPreparationAction.m" lineNumber:27 description:@"Menu could not be archived."];
  }
  v6 = objc_opt_new();
  [v6 setObject:v5 forSetting:0];
  v10.receiver = self;
  v10.super_class = (Class)_UIOMenuPreparationResponse;
  v7 = [(_UIOMenuPreparationResponse *)&v10 initWithInfo:v6 error:0];

  return v7;
}

- (UIMenu)preparedMenu
{
  v3 = (void *)MEMORY[0x1E4F28DC0];
  uint64_t v4 = objc_opt_class();
  v5 = [(_UIOMenuPreparationResponse *)self info];
  v6 = [v5 objectForSetting:0];
  v7 = [v3 unarchivedObjectOfClass:v4 fromData:v6 error:0];

  return (UIMenu *)v7;
}

- (void)setPreparedMenu:(id)a3
{
}

- (void).cxx_destruct
{
}

@end