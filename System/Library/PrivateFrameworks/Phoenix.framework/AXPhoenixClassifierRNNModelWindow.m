@interface AXPhoenixClassifierRNNModelWindow
- (BOOL)foundTap;
- (MLMultiArray)emptyHistoryArray;
- (MLMultiArray)historyArray;
- (NSArray)historyShape;
- (unint64_t)samplesSinceLastTap;
- (unint64_t)tapCount;
- (void)resetHistory;
- (void)setEmptyHistoryArray:(id)a3;
- (void)setFoundTap:(BOOL)a3;
- (void)setHistoryArray:(id)a3;
- (void)setHistoryShape:(id)a3;
- (void)setSamplesSinceLastTap:(unint64_t)a3;
- (void)setTapCount:(unint64_t)a3;
- (void)updateHistoryShape:(id)a3;
@end

@implementation AXPhoenixClassifierRNNModelWindow

- (void)resetHistory
{
  v2 = [(AXPhoenixClassifierRNNModelWindow *)self emptyHistoryArray];
  -[AXPhoenixClassifierRNNModelWindow setHistoryArray:](self, "setHistoryArray:");
}

- (void)updateHistoryShape:(id)a3
{
  v14[2] = *MEMORY[0x263EF8340];
  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(AXPhoenixClassifierRNNModelWindow *)v13 setHistoryShape:location[0]];
  id v3 = objc_alloc(MEMORY[0x263F00DA8]);
  v10 = (void *)[v3 initWithShape:location[0] dataType:65568 error:0];
  -[AXPhoenixClassifierRNNModelWindow setEmptyHistoryArray:](v13, "setEmptyHistoryArray:");

  for (unint64_t i = 0; ; ++i)
  {
    v8 = [(AXPhoenixClassifierRNNModelWindow *)v13 historyShape];
    id v7 = [(NSArray *)v8 lastObject];
    BOOL v9 = i >= [v7 unsignedIntegerValue];

    if (v9) {
      break;
    }
    v6 = [(AXPhoenixClassifierRNNModelWindow *)v13 emptyHistoryArray];
    v14[0] = &unk_26EA418D8;
    id v5 = (id)[NSNumber numberWithUnsignedInteger:i];
    v14[1] = v5;
    id v4 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:2];
    -[MLMultiArray setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", &unk_26EA418C8);
  }
  [(AXPhoenixClassifierRNNModelWindow *)v13 resetHistory];
  objc_storeStrong(location, 0);
}

- (BOOL)foundTap
{
  return self->_foundTap;
}

- (void)setFoundTap:(BOOL)a3
{
  self->_foundTap = a3;
}

- (unint64_t)tapCount
{
  return self->_tapCount;
}

- (void)setTapCount:(unint64_t)a3
{
  self->_tapCount = a3;
}

- (unint64_t)samplesSinceLastTap
{
  return self->_samplesSinceLastTap;
}

- (void)setSamplesSinceLastTap:(unint64_t)a3
{
  self->_samplesSinceLastTap = a3;
}

- (NSArray)historyShape
{
  return self->_historyShape;
}

- (void)setHistoryShape:(id)a3
{
}

- (MLMultiArray)historyArray
{
  return self->_historyArray;
}

- (void)setHistoryArray:(id)a3
{
}

- (MLMultiArray)emptyHistoryArray
{
  return self->_emptyHistoryArray;
}

- (void)setEmptyHistoryArray:(id)a3
{
}

- (void).cxx_destruct
{
}

@end