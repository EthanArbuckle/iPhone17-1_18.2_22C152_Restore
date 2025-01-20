@interface ReplayPagesTestRunner
- (BOOL)eternal;
- (BOOL)loadTestSuiteFile:(id)a3;
- (void)dealloc;
- (void)finishedTestPage:(id)a3;
- (void)setEternal:(BOOL)a3;
- (void)startNextPage;
@end

@implementation ReplayPagesTestRunner

- (void)dealloc
{
  suiteFile = self->_suiteFile;
  if (suiteFile)
  {
    fclose(suiteFile);
    self->_suiteFile = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)ReplayPagesTestRunner;
  [(PageLoadTestRunner *)&v4 dealloc];
}

- (BOOL)loadTestSuiteFile:(id)a3
{
  id v4 = a3;
  suiteFile = self->_suiteFile;
  if (suiteFile) {
    fclose(suiteFile);
  }
  id v6 = v4;
  v7 = fopen((const char *)[v6 UTF8String], "r");
  self->_suiteFile = v7;
  if (!v7)
  {
    uint64_t v8 = *__error();
    v9 = __error();
    [(PageLoadTestRunner *)self log:@"Error %d, could not open %@: %s", v8, v6, strerror(*v9)];
  }

  return v7 != 0;
}

- (void)finishedTestPage:(id)a3
{
  id v4 = a3;
  ++self->_attemptCount;
  id v6 = v4;
  if ([v4 status] == 5) {
    ++self->_successCount;
  }
  [(PageLoadTestRunner *)self log:@"%4lu: %@", self->_attemptCount, v6];
  if (self->_suiteFile)
  {
    v5 = [(NSMutableArray *)self->super.super._pageLoadArray objectAtIndexedSubscript:self->super.super._currentTestIteration];
    [v5 removeObject:v6];
  }
}

- (void)startNextPage
{
  suiteFile = self->_suiteFile;
  if (suiteFile)
  {
    uint64_t v4 = MEMORY[0x1E4F14390];
    while (1)
    {
      size_t v22 = 0;
      v5 = fgetln(suiteFile, &v22);
      if (!v5) {
        break;
      }
      id v6 = v5;
      if ([(PageLoadTestRunner *)self skipCount])
      {
        [(PageLoadTestRunner *)self setSkipCount:[(PageLoadTestRunner *)self skipCount] - 1];
        goto LABEL_9;
      }
      if (v22)
      {
        for (size_t i = v22 - 1; i != -1; --i)
        {
          unsigned int v9 = v6[i];
          if ((v9 & 0x80000000) != 0)
          {
            if (!__maskrune(v9, 0x4000uLL))
            {
LABEL_19:
              if (v22 && *v6 != 35)
              {
                id v10 = [NSString alloc];
                v11 = (void *)[v10 initWithBytesNoCopy:v6 length:v22 encoding:4 freeWhenDone:0];
                v12 = [MEMORY[0x1E4F1CB10] URLWithString:v11];
                [(PageLoadTestRunner *)self addPageURL:v12 withProcessSwap:0];

                goto LABEL_28;
              }
              break;
            }
          }
          else if ((*(_DWORD *)(v4 + 4 * v9 + 60) & 0x4000) == 0)
          {
            goto LABEL_19;
          }
          size_t v22 = i;
        }
      }
LABEL_9:
      suiteFile = self->_suiteFile;
      if (!suiteFile) {
        goto LABEL_29;
      }
    }
    if (self->_eternal)
    {
      v7 = self->_suiteFile;
      if (!ferror(v7))
      {
        rewind(v7);
        goto LABEL_9;
      }
    }
  }
  else
  {
    v13 = [(NSMutableArray *)self->super.super._pageLoadArray objectAtIndexedSubscript:self->super.super._currentTestIteration];
    v11 = v13;
    if (self->_eternal)
    {
      unint64_t attemptCount = self->_attemptCount;
      if (attemptCount)
      {
        if (!(attemptCount % [v13 count]))
        {
          uint64_t v15 = [v11 count];
          if (v15)
          {
            uint64_t v16 = v15 - 1;
            do
            {
              v17 = [v11 objectAtIndex:v16];
              v18 = [PageLoad alloc];
              v19 = [v17 URL];
              v20 = [(PageLoad *)v18 initWithURL:v19 withProcessSwap:0];

              [v11 replaceObjectAtIndex:v16 withObject:v20];
              --v16;
            }
            while (v16 != -1);
          }
        }
      }
    }
LABEL_28:
  }
LABEL_29:
  v21.receiver = self;
  v21.super_class = (Class)ReplayPagesTestRunner;
  [(PageLoadTestRunner *)&v21 startNextPage];
}

- (BOOL)eternal
{
  return self->_eternal;
}

- (void)setEternal:(BOOL)a3
{
  self->_eternal = a3;
}

@end