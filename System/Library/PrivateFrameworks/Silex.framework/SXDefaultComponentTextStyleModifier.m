@interface SXDefaultComponentTextStyleModifier
- (BOOL)shouldReturnUnmodifiedDOM;
- (void)modifyDOM:(id)a3 context:(id)a4;
- (void)setShouldReturnUnmodifiedDOM:(BOOL)a3;
@end

@implementation SXDefaultComponentTextStyleModifier

- (void)modifyDOM:(id)a3 context:(id)a4
{
  id v19 = a3;
  id v6 = a4;
  if (!self->_shouldReturnUnmodifiedDOM)
  {
    v7 = [v19 componentTextStyles];
    v8 = [v7 objectForKey:@"default"];

    if (v8
      && [v8 fontSize] != 0x7FFFFFFFFFFFFFFFLL
      && ([v8 textColor], v9 = objc_claimAutoreleasedReturnValue(), v9, v9))
    {
      self->_shouldReturnUnmodifiedDOM = 1;
    }
    else
    {
      v10 = [v8 JSONRepresentation];
      v11 = v10;
      if (!v10) {
        v10 = (void *)MEMORY[0x263EFFA78];
      }
      v12 = (void *)[v10 mutableCopy];

      if ([v8 fontSize] == 0x7FFFFFFFFFFFFFFFLL) {
        [v12 setObject:&unk_26D593D28 forKey:@"fontSize"];
      }
      v13 = [v8 textColor];

      if (!v13) {
        [v12 setObject:@"#000" forKey:@"textColor"];
      }
      v14 = [v8 identifier];

      if (!v14) {
        [v12 setObject:@"default" forKey:@"identifier"];
      }
      v15 = [SXComponentTextStyle alloc];
      v16 = [v6 specVersion];
      uint64_t v17 = [(SXJSONObject *)v15 initWithJSONObject:v12 andVersion:v16];

      v18 = [v19 componentTextStyles];
      [v18 setObject:v17 forKey:@"default"];

      v8 = (void *)v17;
    }
  }
}

- (BOOL)shouldReturnUnmodifiedDOM
{
  return self->_shouldReturnUnmodifiedDOM;
}

- (void)setShouldReturnUnmodifiedDOM:(BOOL)a3
{
  self->_shouldReturnUnmodifiedDOM = a3;
}

@end