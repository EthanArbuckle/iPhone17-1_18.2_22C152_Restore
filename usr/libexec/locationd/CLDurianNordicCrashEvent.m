@interface CLDurianNordicCrashEvent
- (CLDurianNordicCrashEvent)initWithData:(id)a3;
- (id)description;
- (unint64_t)currentTicks;
- (unint64_t)referenceTicks;
- (unint64_t)referenceWallTime;
- (unsigned)pc;
- (unsigned)truncatedReason;
@end

@implementation CLDurianNordicCrashEvent

- (CLDurianNordicCrashEvent)initWithData:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CLDurianNordicCrashEvent;
  v4 = [(CLDurianNordicCrashEvent *)&v9 init];
  if (v4)
  {
    v5 = (char *)[a3 bytes];
    __int16 v6 = *(_WORD *)(v5 + 1);
    BYTE2(v4->_pc) = v5[3];
    LOWORD(v4->_pc) = v6;
    v4->_truncatedReason = *((_WORD *)v5 + 2);
    int v7 = *(_DWORD *)(v5 + 6);
    BYTE4(v4->_referenceWallTime) = v5[10];
    LODWORD(v4->_referenceWallTime) = v7;
    LOBYTE(v7) = v5[15];
    LODWORD(v4->_referenceTicks) = *(_DWORD *)(v5 + 11);
    BYTE4(v4->_referenceTicks) = v7;
    LOBYTE(v7) = v5[20];
    LODWORD(v4->_currentTicks) = *((_DWORD *)v5 + 4);
    BYTE4(v4->_currentTicks) = v7;
  }
  return v4;
}

- (id)description
{
  return +[NSString stringWithFormat:@"CLDurianNordicCrashEvent <%p>, pc: %u, truncatedReason: %u, referenceWallTime: %llu, referenceTicks: %llu, currentTicks: %llu", self, self->_pc, self->_truncatedReason, self->_referenceWallTime, self->_referenceTicks, self->_currentTicks];
}

- (unsigned)pc
{
  return self->_pc;
}

- (unsigned)truncatedReason
{
  return self->_truncatedReason;
}

- (unint64_t)referenceWallTime
{
  return self->_referenceWallTime;
}

- (unint64_t)referenceTicks
{
  return self->_referenceTicks;
}

- (unint64_t)currentTicks
{
  return self->_currentTicks;
}

@end