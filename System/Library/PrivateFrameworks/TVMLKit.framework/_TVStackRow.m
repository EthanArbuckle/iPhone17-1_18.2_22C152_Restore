@interface _TVStackRow
- (BOOL)isBounded;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHosted;
- (TVRowMetrics)rowMetrics;
- (int64_t)sectionIndex;
- (unint64_t)hash;
- (void)setBounded:(BOOL)a3;
- (void)setHosted:(BOOL)a3;
- (void)setRowMetrics:(TVRowMetrics *)a3;
- (void)setSectionIndex:(int64_t)a3;
@end

@implementation _TVStackRow

- (unint64_t)hash
{
  int64_t v3 = [(_TVStackRow *)self sectionIndex];
  int64_t v4 = v3 ^ [(_TVStackRow *)self isHosted];
  int64_t v5 = v4 ^ [(_TVStackRow *)self isBounded];
  [(_TVStackRow *)self rowMetrics];
  int64_t v6 = v5 ^ v25;
  [(_TVStackRow *)self rowMetrics];
  unint64_t v7 = v6 ^ (unint64_t)v24;
  [(_TVStackRow *)self rowMetrics];
  unint64_t v8 = (unint64_t)v23;
  [(_TVStackRow *)self rowMetrics];
  unint64_t v9 = v7 ^ v8 ^ (unint64_t)v22;
  [(_TVStackRow *)self rowMetrics];
  unint64_t v10 = (unint64_t)v21;
  [(_TVStackRow *)self rowMetrics];
  unint64_t v11 = v10 ^ (unint64_t)v20;
  [(_TVStackRow *)self rowMetrics];
  unint64_t v12 = v9 ^ v11 ^ (unint64_t)v19;
  [(_TVStackRow *)self rowMetrics];
  unint64_t v13 = (unint64_t)v18;
  [(_TVStackRow *)self rowMetrics];
  unint64_t v14 = v13 ^ (unint64_t)v17;
  [(_TVStackRow *)self rowMetrics];
  return v12 ^ v14 ^ (unint64_t)v16;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int64_t v5 = v4;
  }
  else {
    int64_t v5 = 0;
  }
  id v6 = v5;
  v14.receiver = self;
  v14.super_class = (Class)_TVStackRow;
  if (![(_TVStackRow *)&v14 isEqual:v4]) {
    goto LABEL_11;
  }
  [(_TVStackRow *)self rowMetrics];
  if (v6) {
    [v6 rowMetrics];
  }
  else {
    memset(v12, 0, sizeof(v12));
  }
  if (TVRowMetricsEqualToRowMetrics((uint64_t)v13, (uint64_t)v12)
    && (int v7 = -[_TVStackRow isHosted](self, "isHosted"), v7 == [v6 isHosted])
    && (int v8 = -[_TVStackRow isBounded](self, "isBounded"), v8 == [v6 isBounded]))
  {
    int64_t v11 = [(_TVStackRow *)self sectionIndex];
    BOOL v9 = v11 == [v6 sectionIndex];
  }
  else
  {
LABEL_11:
    BOOL v9 = 0;
  }

  return v9;
}

- (TVRowMetrics)rowMetrics
{
  $3BE62F1B3D8F3BC4B4EA8287E388A583 v3 = *($3BE62F1B3D8F3BC4B4EA8287E388A583 *)&self->rowInset.bottom;
  $3BE62F1B3D8F3BC4B4EA8287E388A583 v4 = *($3BE62F1B3D8F3BC4B4EA8287E388A583 *)&self->rowMargin.bottom;
  retstr->rowInset = *($3BE62F1B3D8F3BC4B4EA8287E388A583 *)&self->rowInsetAlt.bottom;
  retstr->rowInsetAlt = v4;
  retstr->rowMargin = *($3BE62F1B3D8F3BC4B4EA8287E388A583 *)&self[1].rowHeight;
  *(_OWORD *)&retstr->rowType = *(_OWORD *)&self->rowPadding.bottom;
  retstr->rowPadding = v3;
  return self;
}

- (void)setRowMetrics:(TVRowMetrics *)a3
{
  *(_OWORD *)&self->_rowMetrics.rowType = *(_OWORD *)&a3->rowType;
  $3BE62F1B3D8F3BC4B4EA8287E388A583 rowPadding = a3->rowPadding;
  $3BE62F1B3D8F3BC4B4EA8287E388A583 rowInset = a3->rowInset;
  $3BE62F1B3D8F3BC4B4EA8287E388A583 rowInsetAlt = a3->rowInsetAlt;
  self->_rowMetrics.rowMargin = a3->rowMargin;
  self->_rowMetrics.$3BE62F1B3D8F3BC4B4EA8287E388A583 rowInsetAlt = rowInsetAlt;
  self->_rowMetrics.$3BE62F1B3D8F3BC4B4EA8287E388A583 rowInset = rowInset;
  self->_rowMetrics.$3BE62F1B3D8F3BC4B4EA8287E388A583 rowPadding = rowPadding;
}

- (BOOL)isHosted
{
  return self->_hosted;
}

- (void)setHosted:(BOOL)a3
{
  self->_hosted = a3;
}

- (BOOL)isBounded
{
  return self->_bounded;
}

- (void)setBounded:(BOOL)a3
{
  self->_bounded = a3;
}

- (int64_t)sectionIndex
{
  return self->_sectionIndex;
}

- (void)setSectionIndex:(int64_t)a3
{
  self->_sectionIndex = a3;
}

@end