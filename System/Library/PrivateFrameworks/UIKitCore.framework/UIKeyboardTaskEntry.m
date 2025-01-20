@interface UIKeyboardTaskEntry
- (NSArray)originatingStack;
- (UIKeyboardTaskEntry)initWithTask:(id)a3 breadcrumb:(id)a4;
- (id)breadcrumb;
- (id)copyWithZone:(_NSZone *)a3;
- (void)execute:(id)a3;
@end

@implementation UIKeyboardTaskEntry

- (UIKeyboardTaskEntry)initWithTask:(id)a3 breadcrumb:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)UIKeyboardTaskEntry;
  v8 = [(UIKeyboardTaskEntry *)&v18 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    id task = v8->__task;
    v8->__id task = (id)v9;

    if (os_variant_has_internal_diagnostics())
    {
      v14 = _UIKeyboardTaskQueueLog();
      BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG);

      if (v15)
      {
        uint64_t v16 = [MEMORY[0x1E4F29060] callStackSymbols];
        originatingStack = v8->_originatingStack;
        v8->_originatingStack = (NSArray *)v16;
      }
    }
    uint64_t v11 = [v7 copy];
    id breadcrumb = v8->_breadcrumb;
    v8->_id breadcrumb = (id)v11;
  }
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(UIKeyboardTaskEntry);
  uint64_t v5 = [self->__task copy];
  id task = v4->__task;
  v4->__id task = (id)v5;

  return v4;
}

- (void)execute:(id)a3
{
  id v4 = a3;
  kdebug_trace();
  kace_get_log();
  uint64_t v5 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v6 = os_signpost_id_make_with_pointer(v5, self);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v7 = v6;
    if (os_signpost_enabled(v5))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1853B0000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "task", "", buf, 2u);
    }
  }

  (*((void (**)(void))self->__task + 2))();
  kdebug_trace();
  kace_get_log();
  v8 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v9 = os_signpost_id_make_with_pointer(v8, self);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v10 = v9;
    if (os_signpost_enabled(v8))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_signpost_emit_with_name_impl(&dword_1853B0000, v8, OS_SIGNPOST_INTERVAL_END, v10, "task", "", v11, 2u);
    }
  }
}

- (NSArray)originatingStack
{
  return self->_originatingStack;
}

- (id)breadcrumb
{
  return self->_breadcrumb;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_breadcrumb, 0);
  objc_storeStrong((id *)&self->_originatingStack, 0);
  objc_storeStrong((id *)&self->__creationStack, 0);
  objc_storeStrong(&self->__task, 0);
}

@end