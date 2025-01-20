@interface WebUndoStep
+ (id)stepWithUndoStep:(void *)a3;
- (WebUndoStep)initWithUndoStep:(void *)a3;
- (id).cxx_construct;
- (void)dealloc;
- (void)step;
@end

@implementation WebUndoStep

- (WebUndoStep)initWithUndoStep:(void *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)WebUndoStep;
  v4 = [(WebUndoStep *)&v9 init];
  v5 = v4;
  if (!v4) {
    return v5;
  }
  v6 = *(UndoStep **)a3;
  *(void *)a3 = 0;
  m_ptr = v4->m_step.m_ptr;
  v5->m_step.m_ptr = v6;
  if (!m_ptr) {
    return v5;
  }
  if (*((_DWORD *)m_ptr + 2) != 1)
  {
    --*((_DWORD *)m_ptr + 2);
    return v5;
  }
  (*(void (**)(UndoStep *))(*(void *)m_ptr + 8))(m_ptr);
  return v5;
}

- (void)dealloc
{
  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainThread(v3, (objc_object *)self) & 1) == 0)
  {
    v4.receiver = self;
    v4.super_class = (Class)WebUndoStep;
    [(WebUndoStep *)&v4 dealloc];
  }
}

+ (id)stepWithUndoStep:(void *)a3
{
  v3 = (void *)CFMakeCollectable([[WebUndoStep alloc] initWithUndoStep:a3]);
  return v3;
}

- (void)step
{
  return self->m_step.m_ptr;
}

- (void).cxx_destruct
{
  m_ptr = self->m_step.m_ptr;
  self->m_step.m_ptr = 0;
  if (m_ptr)
  {
    if (*((_DWORD *)m_ptr + 2) == 1) {
      (*(void (**)(void))(*(void *)m_ptr + 8))();
    }
    else {
      --*((_DWORD *)m_ptr + 2);
    }
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

@end