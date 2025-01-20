@interface MSUiBootHeaderV1
- (BOOL)isValid;
- (BOOL)loadHeaderAtOffset:(unsigned int)a3;
- (id)description;
- (id)packStructure;
- (int64_t)compareTo:(id)a3;
- (unsigned)length;
- (unsigned)valid;
- (void)invalidate;
- (void)makeValid;
- (void)setAsFirstGeneration;
- (void)setValid:(unsigned int)a3;
@end

@implementation MSUiBootHeaderV1

- (id)packStructure
{
  v4[0] = [(MSUiBootHeader *)self headerGeneration];
  v4[1] = [(MSUiBootHeaderV1 *)self valid];
  return +[NSData dataWithBytes:v4 length:8];
}

- (BOOL)loadHeaderAtOffset:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v8 = 0;
  id v5 = [(IOServiceWriter *)[(MSUiBootHeader *)self serviceWriter] readDataAtOffset:*(void *)&a3 ofLength:8];
  id v6 = [v5 length];
  if (v6)
  {
    [v5 getBytes:&v8 length:8];
    [(MSUiBootHeader *)self setHeaderGeneration:v8];
    [(MSUiBootHeaderV1 *)self setValid:HIDWORD(v8)];
    [(MSUiBootHeader *)self setStartLocation:v3];
    [(MSUiBootHeader *)self setImageAddress:0];
  }
  return v6 != 0;
}

- (void)invalidate
{
}

- (void)setAsFirstGeneration
{
}

- (void)makeValid
{
}

- (unsigned)length
{
  return 8;
}

- (id)description
{
  return +[NSString stringWithFormat:@"Generation: 0x%08x. Valid: 0x%08x. HeaderStart: 0x%08x. PayloadAddress: 0x%08x", [(MSUiBootHeader *)self headerGeneration], [(MSUiBootHeaderV1 *)self valid], [(MSUiBootHeader *)self startLocation], [(MSUiBootHeader *)self imageAddress]];
}

- (BOOL)isValid
{
  return [(MSUiBootHeaderV1 *)self valid] != -1 && [(MSUiBootHeaderV1 *)self valid] != 0;
}

- (int64_t)compareTo:(id)a3
{
  if ([(MSUiBootHeaderV1 *)self valid] == -1 && [(MSUiBootHeader *)self headerGeneration])
  {
    unsigned int v6 = [(MSUiBootHeader *)self headerGeneration];
    if (v6 > [a3 headerGeneration] || (objc_msgSend(a3, "isValid") & 1) == 0) {
      return 1;
    }
    goto LABEL_11;
  }
  if ([a3 valid] != -1 || !objc_msgSend(a3, "headerGeneration")) {
    return 0;
  }
  unsigned int v13 = [a3 headerGeneration];
  if (v13 <= [(MSUiBootHeader *)self headerGeneration]
    && [(MSUiBootHeaderV1 *)self isValid])
  {
LABEL_11:
    iBU_LOG_real(@"Found a prepared header with a smaller generation than the valid header.", "-[MSUiBootHeaderV1 compareTo:]", v7, v8, v9, v10, v11, v12, v14);
    return 0;
  }
  return -1;
}

- (unsigned)valid
{
  return self->_valid;
}

- (void)setValid:(unsigned int)a3
{
  self->_valid = a3;
}

@end