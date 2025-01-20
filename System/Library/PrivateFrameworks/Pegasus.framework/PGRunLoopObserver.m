@interface PGRunLoopObserver
- (__CFRunLoopObserver)runLoopObserver;
- (id)actions;
- (void)dealloc;
- (void)setActions:(id)a3;
- (void)setRunLoopObserver:(__CFRunLoopObserver *)a3;
@end

@implementation PGRunLoopObserver

- (void)dealloc
{
  [(PGRunLoopObserver *)self setActions:0];
  v3.receiver = self;
  v3.super_class = (Class)PGRunLoopObserver;
  [(PGRunLoopObserver *)&v3 dealloc];
}

- (void)setActions:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1BA99D810]();
  id actions = self->_actions;
  self->_id actions = v5;

  if (!self->_runLoopObserver)
  {
    if (!self->_actions) {
      goto LABEL_7;
    }
    objc_initWeak(&location, self);
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    v12 = __32__PGRunLoopObserver_setActions___block_invoke;
    v13 = &unk_1E610C730;
    objc_copyWeak(&v14, &location);
    CFRunLoopObserverRef v7 = CFRunLoopObserverCreateWithHandler(0, 0xA0uLL, 0, 0x7FFFFFFFLL, &v10);
    -[PGRunLoopObserver setRunLoopObserver:](self, "setRunLoopObserver:", v7, v10, v11, v12, v13);
    Main = CFRunLoopGetMain();
    CFRunLoopAddObserver(Main, self->_runLoopObserver, (CFRunLoopMode)*MEMORY[0x1E4F1D410]);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  if (!self->_actions)
  {
    runLoopObserver = self->_runLoopObserver;
    if (runLoopObserver)
    {
      CFRunLoopObserverInvalidate(runLoopObserver);
      CFRelease(self->_runLoopObserver);
      [(PGRunLoopObserver *)self setRunLoopObserver:0];
    }
  }
LABEL_7:
}

void __32__PGRunLoopObserver_setActions___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    v2 = [WeakRetained actions];
    [v3 setActions:0];
    if (v2) {
      v2[2](v2);
    }

    id WeakRetained = v3;
  }
}

- (id)actions
{
  return self->_actions;
}

- (__CFRunLoopObserver)runLoopObserver
{
  return self->_runLoopObserver;
}

- (void)setRunLoopObserver:(__CFRunLoopObserver *)a3
{
  self->_runLoopObserver = a3;
}

- (void).cxx_destruct
{
}

@end