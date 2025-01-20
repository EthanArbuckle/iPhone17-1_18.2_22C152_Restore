@interface _UIUnsafeUnretainedCleanupHelper
- (void)dealloc;
- (void)initWithParent:(void *)a3 deallocationHandler:;
@end

@implementation _UIUnsafeUnretainedCleanupHelper

- (void)initWithParent:(void *)a3 deallocationHandler:
{
  id v5 = a3;
  v6 = v5;
  if (!a1) {
    goto LABEL_6;
  }
  if (a2)
  {
    if (v5) {
      goto LABEL_4;
    }
  }
  else
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:sel_initWithParent_deallocationHandler_, a1, @"_UIWeakHelper.m", 56, @"Invalid parameter not satisfying: %@", @"parent != nil" object file lineNumber description];

    if (v6) {
      goto LABEL_4;
    }
  }
  v13 = [MEMORY[0x1E4F28B00] currentHandler];
  [v13 handleFailureInMethod:sel_initWithParent_deallocationHandler_, a1, @"_UIWeakHelper.m", 57, @"Invalid parameter not satisfying: %@", @"deallocationHandler != NULL" object file lineNumber description];

LABEL_4:
  v14.receiver = a1;
  v14.super_class = (Class)_UIUnsafeUnretainedCleanupHelper;
  a1 = objc_msgSendSuper2(&v14, sel_init);
  if (a1)
  {
    v7 = _Block_copy(v6);
    v8 = (void *)a1[1];
    a1[1] = v7;

    a1[2] = a2;
    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:517 capacity:1];
    v10 = (void *)a1[3];
    a1[3] = v9;
  }
LABEL_6:

  return a1;
}

- (void)dealloc
{
  (*((void (**)(void))self->_deallocationHandler + 2))();
  v3.receiver = self;
  v3.super_class = (Class)_UIUnsafeUnretainedCleanupHelper;
  [(_UIUnsafeUnretainedCleanupHelper *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_children, 0);
  objc_storeStrong(&self->_deallocationHandler, 0);
}

@end