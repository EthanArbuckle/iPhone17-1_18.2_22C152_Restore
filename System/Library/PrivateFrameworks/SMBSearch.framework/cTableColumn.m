@interface cTableColumn
- (BOOL)aggregateUsed;
- (BOOL)lengthUsed;
- (BOOL)statusUsed;
- (BOOL)valueUsed;
- (cTableColumn)initWithPropertyNumber:(int)a3 WspCtx:(id)a4;
- (fullPropSpec)propSpec;
- (unsigned)aggregateType;
- (unsigned)lengthOffset;
- (unsigned)statusOffset;
- (unsigned)vType;
- (unsigned)valueOffset;
- (unsigned)valueSize;
- (void)setAggregateType:(unsigned __int8)a3;
- (void)setAggregateUsed:(BOOL)a3;
- (void)setLengthOffset:(unsigned __int16)a3;
- (void)setLengthUsed:(BOOL)a3;
- (void)setPropSpec:(id)a3;
- (void)setStatusOffset:(unsigned __int16)a3;
- (void)setStatusUsed:(BOOL)a3;
- (void)setVType:(unsigned int)a3;
- (void)setValueOffset:(unsigned __int16)a3;
- (void)setValueSize:(unsigned __int16)a3;
- (void)setValueUsed:(BOOL)a3;
@end

@implementation cTableColumn

- (cTableColumn)initWithPropertyNumber:(int)a3 WspCtx:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)cTableColumn;
  v7 = [(cTableColumn *)&v12 init];
  if (v7)
  {
    v8 = [[fullPropSpec alloc] initWithPropertyNumber:v4];
    v9 = (void *)*((void *)v7 + 4);
    *((void *)v7 + 4) = v8;

    if (*((void *)v7 + 4))
    {
      *((_DWORD *)v7 + 6) = 12;
      *((_WORD *)v7 + 4) = 1;
      v7[10] = 1;
      if ([v6 serverSupports64BitOffsets]) {
        __int16 v10 = 24;
      }
      else {
        __int16 v10 = 16;
      }
      *((_WORD *)v7 + 8) = v10;
      *(_WORD *)(v7 + 11) = 257;
    }
    else
    {

      v7 = 0;
    }
  }

  return (cTableColumn *)v7;
}

- (fullPropSpec)propSpec
{
  return (fullPropSpec *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPropSpec:(id)a3
{
}

- (unsigned)vType
{
  return self->_vType;
}

- (void)setVType:(unsigned int)a3
{
  self->_vType = a3;
}

- (BOOL)aggregateUsed
{
  return self->_aggregateUsed;
}

- (void)setAggregateUsed:(BOOL)a3
{
  self->_aggregateUsed = a3;
}

- (unsigned)aggregateType
{
  return self->_aggregateType;
}

- (void)setAggregateType:(unsigned __int8)a3
{
  self->_aggregateType = a3;
}

- (BOOL)valueUsed
{
  return self->_valueUsed;
}

- (void)setValueUsed:(BOOL)a3
{
  self->_valueUsed = a3;
}

- (unsigned)valueOffset
{
  return self->_valueOffset;
}

- (void)setValueOffset:(unsigned __int16)a3
{
  self->_valueOffset = a3;
}

- (unsigned)valueSize
{
  return self->_valueSize;
}

- (void)setValueSize:(unsigned __int16)a3
{
  self->_valueSize = a3;
}

- (BOOL)statusUsed
{
  return self->_statusUsed;
}

- (void)setStatusUsed:(BOOL)a3
{
  self->_statusUsed = a3;
}

- (unsigned)statusOffset
{
  return self->_statusOffset;
}

- (void)setStatusOffset:(unsigned __int16)a3
{
  self->_statusOffset = a3;
}

- (BOOL)lengthUsed
{
  return self->_lengthUsed;
}

- (void)setLengthUsed:(BOOL)a3
{
  self->_lengthUsed = a3;
}

- (unsigned)lengthOffset
{
  return self->_lengthOffset;
}

- (void)setLengthOffset:(unsigned __int16)a3
{
  self->_lengthOffset = a3;
}

- (void).cxx_destruct
{
}

@end