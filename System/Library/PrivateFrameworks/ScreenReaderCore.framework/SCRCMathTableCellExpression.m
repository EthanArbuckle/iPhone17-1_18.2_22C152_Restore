@interface SCRCMathTableCellExpression
- (id)_prefixForCell;
- (id)_suffixForCell;
- (id)mathMLTag;
- (id)speakableDescriptionWithSpeakingStyle:(int64_t)a3 arePausesAllowed:(BOOL)a4;
- (id)speakableSegmentsWithSpeakingStyle:(int64_t)a3 upToDepth:(unint64_t)a4 treePosition:(id)a5;
- (void)_getTableDataIfNecessary;
@end

@implementation SCRCMathTableCellExpression

- (void)_getTableDataIfNecessary
{
  if (!self->_didGetTablePosition)
  {
    id v7 = [(SCRCMathExpression *)self parent];
    v3 = [v7 children];
    unint64_t v4 = [v3 indexOfObjectIdenticalTo:self] + 1;
    v5 = [v7 parent];
    v6 = [v5 children];
    self->_rowIndex = [v6 indexOfObjectIdenticalTo:v7] + 1;
    self->_columnIndex = v4;
    self->_tableRowCount = [v6 count];
    self->_tableColumnCount = [v3 count];
    self->_didGetTablePosition = 1;
  }
}

- (id)speakableDescriptionWithSpeakingStyle:(int64_t)a3 arePausesAllowed:(BOOL)a4
{
  uint64_t v4 = a4;
  [(SCRCMathTableCellExpression *)self _getTableDataIfNecessary];
  if (self->_tableColumnCount == 1)
  {
    id v7 = (void *)MEMORY[0x263F086A0];
    v8 = [(SCRCMathExpression *)self localizedStringForKey:@"math.row.formatter"];
    v9 = (void *)MEMORY[0x263F086A0];
    v10 = NSNumber;
    uint64_t v11 = 48;
LABEL_5:
    v12 = [v10 numberWithInteger:*(Class *)((char *)&self->super.super.super.super.isa + v11)];
    v13 = [(SCRCMathExpression *)self localizedStringForNumber:v12];
    v14 = [v9 scrcStringWithString:v13];
    v15 = objc_msgSend(v7, "scrcStringWithFormat:", v8, v14);
    goto LABEL_7;
  }
  id v7 = (void *)MEMORY[0x263F086A0];
  if (self->_tableRowCount == 1)
  {
    v8 = [(SCRCMathExpression *)self localizedStringForKey:@"math.column.formatter"];
    v9 = (void *)MEMORY[0x263F086A0];
    v10 = NSNumber;
    uint64_t v11 = 56;
    goto LABEL_5;
  }
  v8 = [(SCRCMathExpression *)self localizedStringForKey:@"math.row.and.column.formatter"];
  v16 = (void *)MEMORY[0x263F086A0];
  unsigned int v29 = v4;
  v12 = [NSNumber numberWithInteger:self->_rowIndex];
  v13 = [(SCRCMathExpression *)self localizedStringForNumber:v12];
  v14 = [v16 scrcStringWithString:v13];
  v17 = (void *)MEMORY[0x263F086A0];
  v18 = [NSNumber numberWithInteger:self->_columnIndex];
  v19 = [(SCRCMathExpression *)self localizedStringForNumber:v18];
  v20 = [v17 scrcStringWithString:v19];
  v15 = objc_msgSend(v7, "scrcStringWithFormat:", v8, v14, v20);

  uint64_t v4 = v29;
LABEL_7:

  v30.receiver = self;
  v30.super_class = (Class)SCRCMathTableCellExpression;
  v21 = [(SCRCMathRowExpression *)&v30 speakableDescriptionWithSpeakingStyle:a3 arePausesAllowed:v4];
  if (![v21 length])
  {
    v22 = (void *)MEMORY[0x263F086A0];
    v23 = [(SCRCMathExpression *)self localizedStringForKey:@"empty.content"];
    uint64_t v24 = [v22 scrcStringWithString:v23];

    v21 = (void *)v24;
  }
  v25 = (void *)MEMORY[0x263F086A0];
  v26 = [(SCRCMathExpression *)self localizedStringForKey:@"math.row.column.with.content.formatter"];
  v27 = objc_msgSend(v25, "scrcStringWithFormat:", v26, v15, v21);

  return v27;
}

- (id)speakableSegmentsWithSpeakingStyle:(int64_t)a3 upToDepth:(unint64_t)a4 treePosition:(id)a5
{
  v22[1] = *MEMORY[0x263EF8340];
  id v8 = a5;
  v21.receiver = self;
  v21.super_class = (Class)SCRCMathTableCellExpression;
  v9 = [(SCRCMathArrayExpression *)&v21 speakableSegmentsWithSpeakingStyle:a3 upToDepth:a4 treePosition:v8];
  if (![v9 count])
  {
    v10 = (void *)MEMORY[0x263F086A0];
    uint64_t v11 = NSString;
    v12 = [(SCRCMathTableCellExpression *)self _prefixForCell];
    v13 = [v12 string];
    v14 = [(SCRCMathExpression *)self localizedStringForKey:@"empty.content"];
    v15 = [(SCRCMathTableCellExpression *)self _suffixForCell];
    v16 = [v15 string];
    v17 = [v11 stringWithFormat:@"%@%@%@", v13, v14, v16];
    v18 = [v10 scrcStringWithString:v17 treePosition:v8];

    v22[0] = v18;
    uint64_t v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:1];

    v9 = (void *)v19;
  }

  return v9;
}

- (id)_prefixForCell
{
  [(SCRCMathTableCellExpression *)self _getTableDataIfNecessary];
  if (self->_tableColumnCount == 1)
  {
    v3 = (void *)MEMORY[0x263F086A0];
    uint64_t v4 = [(SCRCMathExpression *)self localizedStringForKey:@"segment.table.row.prefix.formatter"];
    v5 = (void *)MEMORY[0x263F086A0];
    v6 = NSNumber;
    uint64_t v7 = 48;
LABEL_5:
    id v8 = [v6 numberWithInteger:*(Class *)((char *)&self->super.super.super.super.isa + v7)];
    v9 = [(SCRCMathExpression *)self localizedStringForNumber:v8];
    v10 = [v5 scrcStringWithString:v9];
    uint64_t v11 = objc_msgSend(v3, "scrcStringWithFormat:", v4, v10);
    goto LABEL_7;
  }
  v3 = (void *)MEMORY[0x263F086A0];
  if (self->_tableRowCount == 1)
  {
    uint64_t v4 = [(SCRCMathExpression *)self localizedStringForKey:@"segment.table.column.prefix.formatter"];
    v5 = (void *)MEMORY[0x263F086A0];
    v6 = NSNumber;
    uint64_t v7 = 56;
    goto LABEL_5;
  }
  uint64_t v4 = [(SCRCMathExpression *)self localizedStringForKey:@"segment.table.row.column.prefix.formatter"];
  v12 = (void *)MEMORY[0x263F086A0];
  id v8 = [NSNumber numberWithInteger:self->_rowIndex];
  v9 = [(SCRCMathExpression *)self localizedStringForNumber:v8];
  v10 = [v12 scrcStringWithString:v9];
  v13 = (void *)MEMORY[0x263F086A0];
  v14 = [NSNumber numberWithInteger:self->_columnIndex];
  v15 = [(SCRCMathExpression *)self localizedStringForNumber:v14];
  v16 = [v13 scrcStringWithString:v15];
  uint64_t v11 = objc_msgSend(v3, "scrcStringWithFormat:", v4, v10, v16);

LABEL_7:
  return v11;
}

- (id)_suffixForCell
{
  [(SCRCMathTableCellExpression *)self _getTableDataIfNecessary];
  if (self->_tableColumnCount == 1)
  {
    v3 = (void *)MEMORY[0x263F086A0];
    uint64_t v4 = [(SCRCMathExpression *)self localizedStringForKey:@"segment.table.row.suffix.formatter"];
    v5 = (void *)MEMORY[0x263F086A0];
    v6 = NSNumber;
    uint64_t v7 = 48;
LABEL_5:
    id v8 = [v6 numberWithInteger:*(Class *)((char *)&self->super.super.super.super.isa + v7)];
    v9 = [(SCRCMathExpression *)self localizedStringForNumber:v8];
    v10 = [v5 scrcStringWithString:v9];
    uint64_t v11 = objc_msgSend(v3, "scrcStringWithFormat:", v4, v10);
    goto LABEL_7;
  }
  v3 = (void *)MEMORY[0x263F086A0];
  if (self->_tableRowCount == 1)
  {
    uint64_t v4 = [(SCRCMathExpression *)self localizedStringForKey:@"segment.table.column.suffix.formatter"];
    v5 = (void *)MEMORY[0x263F086A0];
    v6 = NSNumber;
    uint64_t v7 = 56;
    goto LABEL_5;
  }
  uint64_t v4 = [(SCRCMathExpression *)self localizedStringForKey:@"segment.table.row.column.suffix.formatter"];
  v12 = (void *)MEMORY[0x263F086A0];
  id v8 = [NSNumber numberWithInteger:self->_rowIndex];
  v9 = [(SCRCMathExpression *)self localizedStringForNumber:v8];
  v10 = [v12 scrcStringWithString:v9];
  v13 = (void *)MEMORY[0x263F086A0];
  v14 = [NSNumber numberWithInteger:self->_columnIndex];
  v15 = [(SCRCMathExpression *)self localizedStringForNumber:v14];
  v16 = [v13 scrcStringWithString:v15];
  uint64_t v11 = objc_msgSend(v3, "scrcStringWithFormat:", v4, v10, v16);

LABEL_7:
  return v11;
}

- (id)mathMLTag
{
  return @"mtd";
}

@end