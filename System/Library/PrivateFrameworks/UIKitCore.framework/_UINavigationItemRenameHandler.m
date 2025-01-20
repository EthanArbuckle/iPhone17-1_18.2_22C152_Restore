@interface _UINavigationItemRenameHandler
+ (BOOL)defaultNavigationItem:(id)a3 shouldEndRenamingWithTitle:(id)a4;
+ (BOOL)defaultNavigationItemShouldBeginRenaming:(id)a3 forValidDelegate:(BOOL)a4;
+ (id)defaultNavigationItem:(id)a3 willBeginRenamingWithSuggestedTitle:(id)a4 selectedRange:(_NSRange *)a5;
+ (id)handlerWithDidEndRenamingHandler:(id)a3;
- (BOOL)_canRename;
- (BOOL)_shouldEndRenamingWithTitle:(id)a3;
- (UINavigationItem)associatedItem;
- (_UINavigationItemRenameHandler)init;
- (_UINavigationItemRenameHandler)initWithDidEndRenamingHandler:(id)a3;
- (id)_fileURLForRenaming;
- (id)_willBeginRenamingWithTitle:(id)a3 selectedRange:(_NSRange *)a4;
- (id)didEndRenamingHandler;
- (id)fileRenameDidEnd;
- (id)fileRenameDidFail;
- (id)fileURLForRenaming;
- (id)shouldBeginRenamingHandler;
- (id)shouldEndRenamingHandler;
- (id)willBeginRenamingHandler;
- (id)willBeginRenamingWithRangeHandler;
- (void)_didEndRenamingWithTitle:(id)a3;
- (void)_fileRenameDidEndWithFinalURL:(id)a3;
- (void)_fileRenameDidFailWithError:(id)a3;
- (void)setAssociatedItem:(id)a3;
- (void)setDidEndRenamingHandler:(id)a3;
- (void)setFileRenameDidEnd:(id)a3;
- (void)setFileRenameDidFail:(id)a3;
- (void)setFileURLForRenaming:(id)a3;
- (void)setShouldBeginRenamingHandler:(id)a3;
- (void)setShouldEndRenamingHandler:(id)a3;
- (void)setWillBeginRenamingHandler:(id)a3;
- (void)setWillBeginRenamingWithRangeHandler:(id)a3;
@end

@implementation _UINavigationItemRenameHandler

- (_UINavigationItemRenameHandler)init
{
  return 0;
}

- (_UINavigationItemRenameHandler)initWithDidEndRenamingHandler:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"_UINavigationItemRenameHandler.m", 24, @"Invalid parameter not satisfying: %@", @"didEndRenamingHandler != NULL" object file lineNumber description];
  }
  v10.receiver = self;
  v10.super_class = (Class)_UINavigationItemRenameHandler;
  v6 = [(_UINavigationItemRenameHandler *)&v10 init];
  v7 = v6;
  if (v6) {
    [(_UINavigationItemRenameHandler *)v6 setDidEndRenamingHandler:v5];
  }

  return v7;
}

+ (id)handlerWithDidEndRenamingHandler:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithDidEndRenamingHandler:v4];

  return v5;
}

- (UINavigationItem)associatedItem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_associatedItem);
  return (UINavigationItem *)WeakRetained;
}

- (void)setAssociatedItem:(id)a3
{
}

- (id)shouldBeginRenamingHandler
{
  return self->_shouldBeginRenamingHandler;
}

- (void)setShouldBeginRenamingHandler:(id)a3
{
}

- (id)willBeginRenamingHandler
{
  return self->_willBeginRenamingHandler;
}

- (void)setWillBeginRenamingHandler:(id)a3
{
}

- (id)didEndRenamingHandler
{
  return self->_didEndRenamingHandler;
}

- (void)setDidEndRenamingHandler:(id)a3
{
}

- (id)willBeginRenamingWithRangeHandler
{
  return self->_willBeginRenamingWithRangeHandler;
}

- (void)setWillBeginRenamingWithRangeHandler:(id)a3
{
}

- (id)shouldEndRenamingHandler
{
  return self->_shouldEndRenamingHandler;
}

- (void)setShouldEndRenamingHandler:(id)a3
{
}

- (id)fileURLForRenaming
{
  return self->_fileURLForRenaming;
}

- (void)setFileURLForRenaming:(id)a3
{
}

- (id)fileRenameDidFail
{
  return self->_fileRenameDidFail;
}

- (void)setFileRenameDidFail:(id)a3
{
}

- (id)fileRenameDidEnd
{
  return self->_fileRenameDidEnd;
}

- (void)setFileRenameDidEnd:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fileRenameDidEnd, 0);
  objc_storeStrong(&self->_fileRenameDidFail, 0);
  objc_storeStrong(&self->_fileURLForRenaming, 0);
  objc_storeStrong(&self->_shouldEndRenamingHandler, 0);
  objc_storeStrong(&self->_willBeginRenamingWithRangeHandler, 0);
  objc_storeStrong(&self->_didEndRenamingHandler, 0);
  objc_storeStrong(&self->_willBeginRenamingHandler, 0);
  objc_storeStrong(&self->_shouldBeginRenamingHandler, 0);
  objc_destroyWeak((id *)&self->_associatedItem);
}

- (BOOL)_canRename
{
  shouldBeginRenamingHandler = (uint64_t (**)(void))self->_shouldBeginRenamingHandler;
  if (shouldBeginRenamingHandler) {
    return shouldBeginRenamingHandler[2]();
  }
  else {
    return +[_UINavigationItemRenameHandler defaultNavigationItemShouldBeginRenaming:0 forValidDelegate:1];
  }
}

- (id)_willBeginRenamingWithTitle:(id)a3 selectedRange:(_NSRange *)a4
{
  id v6 = a3;
  willBeginRenamingHandler = (void (**)(id, id))self->_willBeginRenamingHandler;
  if (willBeginRenamingHandler)
  {
    v8 = willBeginRenamingHandler[2](willBeginRenamingHandler, v6);

    NSUInteger v9 = [v8 length];
    a4->location = 0;
    a4->length = v9;
  }
  else
  {
    willBeginRenamingWithRangeHandler = (void (**)(id, id, _NSRange *))self->_willBeginRenamingWithRangeHandler;
    if (willBeginRenamingWithRangeHandler) {
      willBeginRenamingWithRangeHandler[2](willBeginRenamingWithRangeHandler, v6, a4);
    }
    else {
    v8 = +[_UINavigationItemRenameHandler defaultNavigationItem:0 willBeginRenamingWithSuggestedTitle:v6 selectedRange:a4];
    }
  }
  return v8;
}

- (BOOL)_shouldEndRenamingWithTitle:(id)a3
{
  shouldEndRenamingHandler = (uint64_t (**)(id, id))self->_shouldEndRenamingHandler;
  if (shouldEndRenamingHandler) {
    return shouldEndRenamingHandler[2](shouldEndRenamingHandler, a3);
  }
  else {
    return +[_UINavigationItemRenameHandler defaultNavigationItem:0 shouldEndRenamingWithTitle:a3];
  }
}

- (void)_didEndRenamingWithTitle:(id)a3
{
}

- (id)_fileURLForRenaming
{
  fileURLForRenaming = (void (**)(void, void))self->_fileURLForRenaming;
  if (fileURLForRenaming)
  {
    ((void (**)(void, SEL))fileURLForRenaming)[2](fileURLForRenaming, a2);
    fileURLForRenaming = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
  }
  return fileURLForRenaming;
}

- (void)_fileRenameDidFailWithError:(id)a3
{
  fileRenameDidFail = (void (**)(id, id))self->_fileRenameDidFail;
  if (fileRenameDidFail) {
    fileRenameDidFail[2](fileRenameDidFail, a3);
  }
}

- (void)_fileRenameDidEndWithFinalURL:(id)a3
{
  fileRenameDidEnd = (void (**)(id, id))self->_fileRenameDidEnd;
  if (fileRenameDidEnd) {
    fileRenameDidEnd[2](fileRenameDidEnd, a3);
  }
}

+ (BOOL)defaultNavigationItemShouldBeginRenaming:(id)a3 forValidDelegate:(BOOL)a4
{
  return a4;
}

+ (id)defaultNavigationItem:(id)a3 willBeginRenamingWithSuggestedTitle:(id)a4 selectedRange:(_NSRange *)a5
{
  id v5 = a4;
  return v5;
}

+ (BOOL)defaultNavigationItem:(id)a3 shouldEndRenamingWithTitle:(id)a4
{
  return 1;
}

@end