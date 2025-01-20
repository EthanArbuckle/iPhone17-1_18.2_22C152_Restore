@interface VMUProgressBar
- (VMUProgressBar)init;
- (void)colorize:(unsigned int)a3;
- (void)itemCompleteWithStatus:(BOOL)a3;
- (void)setTitle:(id)a3 withTotalItems:(unint64_t)a4;
- (void)updateItemName:(id)a3;
@end

@implementation VMUProgressBar

- (void)setTitle:(id)a3 withTotalItems:(unint64_t)a4
{
  objc_storeStrong((id *)&self->_title, a3);
  id v7 = a3;
  itemName = self->_itemName;
  self->_totalItems = a4;
  self->_itemName = 0;

  self->_itemsDone = 0;
  self->_successes = 0;
  self->_color = 0;
  self->_failures = 0;
  v9 = (FILE *)*MEMORY[0x1E4F143C8];
  id v10 = +[VMUTerminalColorizer controlCodeResetString];
  fprintf(v9, "\n%s%s\n", (const char *)[v10 UTF8String], -[NSString UTF8String](self->_title, "UTF8String"));
}

- (VMUProgressBar)init
{
  v6.receiver = self;
  v6.super_class = (Class)VMUProgressBar;
  v2 = [(VMUProgressBar *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    itemCompletionLock = v2->_itemCompletionLock;
    v2->_itemCompletionLock = (NSLock *)v3;
  }
  return v2;
}

- (void)updateItemName:(id)a3
{
  objc_storeStrong((id *)&self->_itemName, a3);

  [(VMUProgressBar *)self _printProgressBar];
}

- (void)itemCompleteWithStatus:(BOOL)a3
{
  BOOL v3 = a3;
  [(NSLock *)self->_itemCompletionLock lock];
  ++self->_itemsDone;
  uint64_t v5 = 48;
  if (v3) {
    uint64_t v5 = 40;
  }
  ++*(Class *)((char *)&self->super.isa + v5);
  [(VMUProgressBar *)self _printProgressBar];
  itemCompletionLock = self->_itemCompletionLock;

  [(NSLock *)itemCompletionLock unlock];
}

- (void)colorize:(unsigned int)a3
{
  self->_color = a3;
  BOOL v3 = (FILE *)*MEMORY[0x1E4F143C8];
  id v4 = +[VMUTerminalColorizer startColorCodeString:238];
  fputs((const char *)[v4 UTF8String], v3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemCompletionLock, 0);
  objc_storeStrong((id *)&self->_itemName, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end