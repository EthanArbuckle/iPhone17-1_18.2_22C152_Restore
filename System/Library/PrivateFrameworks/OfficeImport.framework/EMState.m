@interface EMState
- (EDSheet)currentSheet;
- (id)hyperlinkForRow:(unint64_t)a3 column:(unint64_t)a4;
- (void)setCurrentSheet:(id)a3;
- (void)setHyperlink:(id)a3 forRow:(unint64_t)a4 column:(unint64_t)a5;
@end

@implementation EMState

- (void)setCurrentSheet:(id)a3
{
}

- (EDSheet)currentSheet
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentSheet);
  return (EDSheet *)WeakRetained;
}

- (id)hyperlinkForRow:(unint64_t)a3 column:(unint64_t)a4
{
  hyperlinks = self->_hyperlinks;
  v5 = [NSNumber numberWithUnsignedLongLong:a4 | (a3 << 16)];
  v6 = [(NSMutableDictionary *)hyperlinks objectForKey:v5];

  return v6;
}

- (void)setHyperlink:(id)a3 forRow:(unint64_t)a4 column:(unint64_t)a5
{
  id v12 = a3;
  hyperlinks = self->_hyperlinks;
  if (!hyperlinks)
  {
    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    v10 = self->_hyperlinks;
    self->_hyperlinks = v9;

    hyperlinks = self->_hyperlinks;
  }
  v11 = [NSNumber numberWithUnsignedLongLong:a5 | (a4 << 16)];
  [(NSMutableDictionary *)hyperlinks setObject:v12 forKey:v11];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hyperlinks, 0);
  objc_destroyWeak((id *)&self->_currentSheet);
  objc_storeStrong((id *)&self->_workbook, 0);
}

@end