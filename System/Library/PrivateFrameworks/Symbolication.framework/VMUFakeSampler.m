@interface VMUFakeSampler
- (VMUFakeSampler)initWithProcessObjectGraph:(id)a3;
- (id)threadDescriptionStringForBacktrace:(id)a3 returnedAddress:(unint64_t *)a4;
@end

@implementation VMUFakeSampler

- (VMUFakeSampler)initWithProcessObjectGraph:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VMUFakeSampler;
  v6 = [(VMUFakeSampler *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_graph, a3);
  }

  return v7;
}

- (id)threadDescriptionStringForBacktrace:(id)a3 returnedAddress:(unint64_t *)a4
{
  id v5 = a3;
  if ([v5 backtraceLength])
  {
    v6 = -[VMUProcessObjectGraph threadNameForAddress:](self->_graph, "threadNameForAddress:", *(void *)[v5 stackFramePointers]);
    if (!v6)
    {
      v6 = [NSString stringWithFormat:@"Thread_%u", [v5 thread]];
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void).cxx_destruct
{
}

@end