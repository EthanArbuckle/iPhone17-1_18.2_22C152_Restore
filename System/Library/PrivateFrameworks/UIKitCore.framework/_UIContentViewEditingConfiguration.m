@interface _UIContentViewEditingConfiguration
- (BOOL)isEqual:(id)a3;
- (BOOL)selectAllTextWhenEditingBegins;
- (BOOL)useTextInputAsLabel;
- (_UIContentViewEditingConfiguration)initWithDidEndHandler:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)didEndHandler;
- (id)shouldBeginHandler;
- (id)shouldChangeHandler;
- (id)shouldEndHandler;
- (void)setSelectAllTextWhenEditingBegins:(BOOL)a3;
- (void)setShouldBeginHandler:(id)a3;
- (void)setShouldChangeHandler:(id)a3;
- (void)setShouldEndHandler:(id)a3;
- (void)setUseTextInputAsLabel:(BOOL)a3;
@end

@implementation _UIContentViewEditingConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    uint64_t v5 = [self->_shouldBeginHandler copy];
    v6 = *(void **)(v4 + 24);
    *(void *)(v4 + 24) = v5;

    uint64_t v7 = [self->_shouldChangeHandler copy];
    v8 = *(void **)(v4 + 32);
    *(void *)(v4 + 32) = v7;

    uint64_t v9 = [self->_shouldEndHandler copy];
    v10 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v9;

    uint64_t v11 = [self->_didEndHandler copy];
    v12 = *(void **)(v4 + 16);
    *(void *)(v4 + 16) = v11;

    *(unsigned char *)(v4 + 8) = self->_useTextInputAsLabel;
    *(unsigned char *)(v4 + 9) = self->_selectAllTextWhenEditingBegins;
  }
  return (id)v4;
}

- (_UIContentViewEditingConfiguration)initWithDidEndHandler:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"_UIContentViewEditingConfiguration.m", 32, @"Invalid parameter not satisfying: %@", @"endHandler" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)_UIContentViewEditingConfiguration;
  v6 = [(_UIContentViewEditingConfiguration *)&v11 init];
  if (v6)
  {
    uint64_t v7 = [v5 copy];
    id didEndHandler = v6->_didEndHandler;
    v6->_id didEndHandler = (id)v7;

    v6->_selectAllTextWhenEditingBegins = 1;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (_UIContentViewEditingConfiguration *)a3;
  id v5 = v4;
  if (self == v4)
  {
    LOBYTE(self) = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    if (self) {
      LOBYTE(self) = (self->_didEndHandler != 0) != (v6->_didEndHandler == 0)
    }
                  && (self->_shouldBeginHandler != 0) != (v6->_shouldBeginHandler == 0)
                  && (self->_shouldChangeHandler != 0) != (v6->_shouldChangeHandler == 0)
                  && (self->_shouldEndHandler != 0) != (v6->_shouldEndHandler == 0)
                  && self->_useTextInputAsLabel == v6->_useTextInputAsLabel
                  && self->_selectAllTextWhenEditingBegins == v6->_selectAllTextWhenEditingBegins;
  }
  else
  {
    LOBYTE(self) = 0;
  }

  return (char)self;
}

- (BOOL)useTextInputAsLabel
{
  return self->_useTextInputAsLabel;
}

- (void)setUseTextInputAsLabel:(BOOL)a3
{
  self->_useTextInputAsLabel = a3;
}

- (BOOL)selectAllTextWhenEditingBegins
{
  return self->_selectAllTextWhenEditingBegins;
}

- (void)setSelectAllTextWhenEditingBegins:(BOOL)a3
{
  self->_selectAllTextWhenEditingBegins = a3;
}

- (id)didEndHandler
{
  return self->_didEndHandler;
}

- (id)shouldBeginHandler
{
  return self->_shouldBeginHandler;
}

- (void)setShouldBeginHandler:(id)a3
{
}

- (id)shouldChangeHandler
{
  return self->_shouldChangeHandler;
}

- (void)setShouldChangeHandler:(id)a3
{
}

- (id)shouldEndHandler
{
  return self->_shouldEndHandler;
}

- (void)setShouldEndHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_shouldEndHandler, 0);
  objc_storeStrong(&self->_shouldChangeHandler, 0);
  objc_storeStrong(&self->_shouldBeginHandler, 0);
  objc_storeStrong(&self->_didEndHandler, 0);
}

@end