@interface PLProcessExitAggregator
- (BOOL)isEqual:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)exitReasonCode;
- (unint64_t)hash;
- (unint64_t)jetsamPriority;
- (unsigned)exitReasonNamespace;
- (unsigned)labelIdx;
- (unsigned)lastTTR;
- (void)setExitReasonCode:(unint64_t)a3;
- (void)setExitReasonNamespace:(unsigned __int8)a3;
- (void)setJetsamPriority:(unint64_t)a3;
- (void)setLabelIdx:(unsigned int)a3;
- (void)setLastTTR:(unsigned int)a3;
@end

@implementation PLProcessExitAggregator

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setLabelIdx:", -[PLProcessExitAggregator labelIdx](self, "labelIdx"));
  objc_msgSend(v4, "setLastTTR:", -[PLProcessExitAggregator lastTTR](self, "lastTTR"));
  objc_msgSend(v4, "setExitReasonNamespace:", -[PLProcessExitAggregator exitReasonNamespace](self, "exitReasonNamespace"));
  objc_msgSend(v4, "setExitReasonCode:", -[PLProcessExitAggregator exitReasonCode](self, "exitReasonCode"));
  return v4;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"labelIdx=%u, lastTTR=%u, exitReasonNamespace=%ud, exitReasonCode=%llu", -[PLProcessExitAggregator labelIdx](self, "labelIdx"), -[PLProcessExitAggregator lastTTR](self, "lastTTR"), -[PLProcessExitAggregator exitReasonNamespace](self, "exitReasonNamespace"), -[PLProcessExitAggregator exitReasonCode](self, "exitReasonCode")];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (unsigned int v5 = -[PLProcessExitAggregator labelIdx](self, "labelIdx"), v5 == [v4 labelIdx])
    && (unsigned int v6 = -[PLProcessExitAggregator lastTTR](self, "lastTTR"), v6 == [v4 lastTTR])
    && (int v7 = [(PLProcessExitAggregator *)self exitReasonNamespace],
        v7 == [v4 exitReasonNamespace]))
  {
    unint64_t v8 = [(PLProcessExitAggregator *)self exitReasonCode];
    BOOL v9 = v8 == [v4 exitReasonCode];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  v3 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[PLProcessExitAggregator labelIdx](self, "labelIdx"));
  uint64_t v4 = [v3 hash];
  unsigned int v5 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[PLProcessExitAggregator lastTTR](self, "lastTTR"));
  uint64_t v6 = [v5 hash] ^ v4;
  int v7 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[PLProcessExitAggregator exitReasonNamespace](self, "exitReasonNamespace"));
  uint64_t v8 = [v7 hash];
  BOOL v9 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[PLProcessExitAggregator exitReasonCode](self, "exitReasonCode"));
  unint64_t v10 = v6 ^ v8 ^ [v9 hash];

  return v10;
}

- (unsigned)labelIdx
{
  return self->_labelIdx;
}

- (void)setLabelIdx:(unsigned int)a3
{
  self->_labelIdx = a3;
}

- (unsigned)lastTTR
{
  return self->_lastTTR;
}

- (void)setLastTTR:(unsigned int)a3
{
  self->_lastTTR = a3;
}

- (unsigned)exitReasonNamespace
{
  return self->_exitReasonNamespace;
}

- (void)setExitReasonNamespace:(unsigned __int8)a3
{
  self->_exitReasonNamespace = a3;
}

- (unint64_t)exitReasonCode
{
  return self->_exitReasonCode;
}

- (void)setExitReasonCode:(unint64_t)a3
{
  self->_exitReasonCode = a3;
}

- (unint64_t)jetsamPriority
{
  return self->_jetsamPriority;
}

- (void)setJetsamPriority:(unint64_t)a3
{
  self->_jetsamPriority = a3;
}

@end