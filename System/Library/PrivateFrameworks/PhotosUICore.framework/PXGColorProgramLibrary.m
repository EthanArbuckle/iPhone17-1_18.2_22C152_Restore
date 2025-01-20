@interface PXGColorProgramLibrary
- (CGColorSpace)destinationColorSpace;
- (PXGColorProgramLibrary)init;
- (PXGColorProgramLibrary)initWithContext:(id)a3 destinationColorSpace:(CGColorSpace *)a4;
- (PXGMetalRenderContext)metalRenderContext;
- (id)colorProgramForSourceColorSpace:(CGColorSpace *)a3 flags:(unint64_t)a4;
- (id)description;
- (void)dealloc;
@end

@implementation PXGColorProgramLibrary

- (id)colorProgramForSourceColorSpace:(CGColorSpace *)a3 flags:(unint64_t)a4
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (CGColorSpaceGetModel(a3) == kCGColorSpaceModelCMYK) {
    PXGGetReconciledColorSpace();
  }
  if (![(NSMutableArray *)self->_programs count]) {
    goto LABEL_8;
  }
  uint64_t v8 = 0;
  while (1)
  {
    v9 = [(NSMutableArray *)self->_programs objectAtIndexedSubscript:v8];
    if ([(PXGColorProgram *)v9 flags] == a4)
    {
      if (MEMORY[0x1AD10B150]([(PXGColorProgram *)v9 sourceColorSpace], a3)) {
        break;
      }
    }

    if (++v8 >= (unint64_t)[(NSMutableArray *)self->_programs count]) {
      goto LABEL_8;
    }
  }
  if (v8)
  {
    programs = self->_programs;
    v11 = v9;
    [(NSMutableArray *)programs removeObjectAtIndex:v8];
    [(NSMutableArray *)self->_programs insertObject:v11 atIndex:0];
  }
  if (!v9)
  {
LABEL_8:
    if ([(NSMutableSet *)self->_failedColorspaces containsObject:a3])
    {
      v9 = 0;
    }
    else
    {
      v9 = [[PXGColorProgram alloc] initWithContext:self->_metalRenderContext sourceColorSpace:a3 destinationColorSpace:[(PXGColorProgramLibrary *)self destinationColorSpace] flags:a4];
      if (v9) {
        [(NSMutableArray *)self->_programs insertObject:v9 atIndex:0];
      }
      else {
        [(NSMutableSet *)self->_failedColorspaces addObject:a3];
      }
    }
  }
  os_unfair_lock_unlock(p_lock);
  return v9;
}

- (CGColorSpace)destinationColorSpace
{
  return self->_destinationColorSpace;
}

- (PXGColorProgramLibrary)initWithContext:(id)a3 destinationColorSpace:(CGColorSpace *)a4
{
  id v8 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PXGColorProgramLibrary;
  v9 = [(PXGColorProgramLibrary *)&v18 init];
  if (v9)
  {
    v10 = [v8 device];

    if (v10)
    {
      if (a4)
      {
LABEL_4:
        objc_storeStrong((id *)&v9->_metalRenderContext, a3);
        v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
        programs = v9->_programs;
        v9->_programs = v11;

        v13 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
        failedColorspaces = v9->_failedColorspaces;
        v9->_failedColorspaces = v13;

        v9->_destinationColorSpace = CGColorSpaceRetain(a4);
        v9->_lock._os_unfair_lock_opaque = 0;
        goto LABEL_5;
      }
    }
    else
    {
      v16 = [MEMORY[0x1E4F28B00] currentHandler];
      [v16 handleFailureInMethod:a2, v9, @"PXGColorProgram.m", 685, @"Invalid parameter not satisfying: %@", @"context.device != nil" object file lineNumber description];

      if (a4) {
        goto LABEL_4;
      }
    }
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, v9, @"PXGColorProgram.m", 686, @"Invalid parameter not satisfying: %@", @"destinationColorSpace != nil" object file lineNumber description];

    goto LABEL_4;
  }
LABEL_5:

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metalRenderContext, 0);
  objc_storeStrong((id *)&self->_failedColorspaces, 0);
  objc_storeStrong((id *)&self->_programs, 0);
}

- (PXGMetalRenderContext)metalRenderContext
{
  return self->_metalRenderContext;
}

- (id)description
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F28E78];
  v16.receiver = self;
  v16.super_class = (Class)PXGColorProgramLibrary;
  v4 = [(PXGColorProgramLibrary *)&v16 description];
  v5 = [v3 stringWithFormat:@"<%@ programs:\n", v4];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v6 = self->_programs;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        [v5 appendFormat:@"%@\n\n", *(void *)(*((void *)&v12 + 1) + 8 * i)];
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
    }
    while (v8);
  }

  [v5 appendString:@">"];
  return v5;
}

- (void)dealloc
{
  CGColorSpaceRelease(self->_destinationColorSpace);
  v3.receiver = self;
  v3.super_class = (Class)PXGColorProgramLibrary;
  [(PXGColorProgramLibrary *)&v3 dealloc];
}

- (PXGColorProgramLibrary)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXGColorProgram.m", 697, @"%s is not available as initializer", "-[PXGColorProgramLibrary init]");

  abort();
}

@end