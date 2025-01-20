@interface AdvMetrics
- (unint64_t)droppedAdvCountforType:(unsigned __int8)a3 by:(unsigned __int8)a4;
- (unint64_t)totalAdvCountforType:(unsigned __int8)a3;
- (unint64_t)totalDroppedAdvCountforType:(unsigned __int8)a3;
- (void)incrementDroppedAdvCountforType:(unsigned __int8)a3 by:(unsigned __int8)a4;
- (void)incrementTotalAdvCountforType:(unsigned __int8)a3;
- (void)incrementTotalDroppedAdvCountforType:(unsigned __int8)a3;
- (void)resetAllCounters;
@end

@implementation AdvMetrics

- (void)incrementTotalAdvCountforType:(unsigned __int8)a3
{
  if ((a3 - 1) <= 0x19) {
    ++self->totalAdvCount[a3];
  }
}

- (unint64_t)totalAdvCountforType:(unsigned __int8)a3
{
  if ((a3 - 1) > 0x19) {
    return 0;
  }
  else {
    return self->totalAdvCount[a3];
  }
}

- (void)incrementTotalDroppedAdvCountforType:(unsigned __int8)a3
{
  if ((a3 - 1) <= 0x19) {
    ++self->totalDroppedAdvCount[a3];
  }
}

- (unint64_t)totalDroppedAdvCountforType:(unsigned __int8)a3
{
  if ((a3 - 1) > 0x19) {
    return 0;
  }
  else {
    return self->totalDroppedAdvCount[a3];
  }
}

- (void)incrementDroppedAdvCountforType:(unsigned __int8)a3 by:(unsigned __int8)a4
{
  if ((a3 - 1) <= 0x19 && (a4 - 1) <= 0x19)
  {
    v5 = (char *)self + 216 * a3 + 8 * a4;
    ++*((void *)v5 + 55);
  }
}

- (unint64_t)droppedAdvCountforType:(unsigned __int8)a3 by:(unsigned __int8)a4
{
  unsigned int v4 = a4 - 1;
  if ((a3 - 1) <= 0x19)
  {
    BOOL v5 = v4 >= 0x19;
    BOOL v6 = v4 == 25;
  }
  else
  {
    BOOL v5 = 1;
    BOOL v6 = 0;
  }
  if (!v6 && v5) {
    return 0;
  }
  else {
    return self->droppedAdvCount[a3][a4];
  }
}

- (void)resetAllCounters
{
  self->totalAdvCount[26] = 0;
  *(_OWORD *)&self->totalAdvCount[24] = 0u;
  *(_OWORD *)&self->totalAdvCount[22] = 0u;
  *(_OWORD *)&self->totalAdvCount[20] = 0u;
  *(_OWORD *)&self->totalAdvCount[18] = 0u;
  *(_OWORD *)&self->totalAdvCount[16] = 0u;
  *(_OWORD *)&self->totalAdvCount[14] = 0u;
  *(_OWORD *)&self->totalAdvCount[12] = 0u;
  *(_OWORD *)&self->totalAdvCount[10] = 0u;
  *(_OWORD *)&self->totalAdvCount[8] = 0u;
  *(_OWORD *)&self->totalAdvCount[6] = 0u;
  *(_OWORD *)&self->totalAdvCount[4] = 0u;
  *(_OWORD *)&self->totalAdvCount[2] = 0u;
  *(_OWORD *)self->totalAdvCount = 0u;
  *(_OWORD *)self->totalDroppedAdvCount = 0u;
  *(_OWORD *)&self->totalDroppedAdvCount[2] = 0u;
  *(_OWORD *)&self->totalDroppedAdvCount[4] = 0u;
  *(_OWORD *)&self->totalDroppedAdvCount[6] = 0u;
  *(_OWORD *)&self->totalDroppedAdvCount[8] = 0u;
  *(_OWORD *)&self->totalDroppedAdvCount[10] = 0u;
  *(_OWORD *)&self->totalDroppedAdvCount[12] = 0u;
  *(_OWORD *)&self->totalDroppedAdvCount[14] = 0u;
  *(_OWORD *)&self->totalDroppedAdvCount[16] = 0u;
  *(_OWORD *)&self->totalDroppedAdvCount[18] = 0u;
  *(_OWORD *)&self->totalDroppedAdvCount[20] = 0u;
  *(_OWORD *)&self->totalDroppedAdvCount[22] = 0u;
  *(_OWORD *)&self->totalDroppedAdvCount[24] = 0u;
  self->totalDroppedAdvCount[26] = 0;
  bzero(self->droppedAdvCount, 0x16C8uLL);
}

@end