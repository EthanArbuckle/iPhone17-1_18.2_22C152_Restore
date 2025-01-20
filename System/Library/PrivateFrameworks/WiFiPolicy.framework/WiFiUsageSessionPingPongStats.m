@interface WiFiUsageSessionPingPongStats
- (BOOL)pingPongSequenceIsLowRssiOnly;
- (BOOL)pingPongSequenceIsReassocOnly;
- (BOOL)pingPongSequenceIsReassocOrLowRSSIOnly;
- (NSArray)sequence;
- (WiFiUsageSessionPingPongStats)initWithPingPongSequence:(id)a3;
- (unint64_t)pingPongNth;
- (void)setPingPongNth:(unint64_t)a3;
- (void)setPingPongSequenceIsLowRssiOnly:(BOOL)a3;
- (void)setPingPongSequenceIsReassocOnly:(BOOL)a3;
- (void)setPingPongSequenceIsReassocOrLowRSSIOnly:(BOOL)a3;
- (void)setSequence:(id)a3;
@end

@implementation WiFiUsageSessionPingPongStats

- (WiFiUsageSessionPingPongStats)initWithPingPongSequence:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)WiFiUsageSessionPingPongStats;
  v5 = [(WiFiUsageSessionPingPongStats *)&v20 init];
  v6 = v5;
  if (v5)
  {
    [(WiFiUsageSessionPingPongStats *)v5 setSequence:v4];
    -[WiFiUsageSessionPingPongStats setPingPongNth:](v6, "setPingPongNth:", [v4 count] - 2);
    uint64_t v7 = [v4 count];
    v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"SELF = 'Low RSSI'"];
    v9 = [v4 filteredArrayUsingPredicate:v8];
    -[WiFiUsageSessionPingPongStats setPingPongSequenceIsLowRssiOnly:](v6, "setPingPongSequenceIsLowRssiOnly:", v7 == [v9 count]);

    uint64_t v10 = [v4 count];
    v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"SELF = 'Reassoc'"];
    v12 = [v4 filteredArrayUsingPredicate:v11];
    -[WiFiUsageSessionPingPongStats setPingPongSequenceIsReassocOnly:](v6, "setPingPongSequenceIsReassocOnly:", v10 == [v12 count]);

    uint64_t v13 = [v4 count];
    v14 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"SELF = 'Low RSSI' OR SELF = 'Reassoc'"];
    v15 = [v4 filteredArrayUsingPredicate:v14];
    -[WiFiUsageSessionPingPongStats setPingPongSequenceIsReassocOrLowRSSIOnly:](v6, "setPingPongSequenceIsReassocOrLowRSSIOnly:", v13 == [v15 count]);

    v16 = @"YES";
    if (v6->_pingPongSequenceIsLowRssiOnly) {
      v17 = @"YES";
    }
    else {
      v17 = @"NO";
    }
    if (v6->_pingPongSequenceIsReassocOnly) {
      v18 = @"YES";
    }
    else {
      v18 = @"NO";
    }
    if (!v6->_pingPongSequenceIsReassocOrLowRSSIOnly) {
      v16 = @"NO";
    }
    NSLog(&cfstr_SPingpongseque.isa, "-[WiFiUsageSessionPingPongStats initWithPingPongSequence:]", v6->_sequence, v6->_pingPongNth, v17, v18, v16);
  }

  return v6;
}

- (unint64_t)pingPongNth
{
  return self->_pingPongNth;
}

- (void)setPingPongNth:(unint64_t)a3
{
  self->_pingPongNth = a3;
}

- (NSArray)sequence
{
  return self->_sequence;
}

- (void)setSequence:(id)a3
{
}

- (BOOL)pingPongSequenceIsLowRssiOnly
{
  return self->_pingPongSequenceIsLowRssiOnly;
}

- (void)setPingPongSequenceIsLowRssiOnly:(BOOL)a3
{
  self->_pingPongSequenceIsLowRssiOnly = a3;
}

- (BOOL)pingPongSequenceIsReassocOnly
{
  return self->_pingPongSequenceIsReassocOnly;
}

- (void)setPingPongSequenceIsReassocOnly:(BOOL)a3
{
  self->_pingPongSequenceIsReassocOnly = a3;
}

- (BOOL)pingPongSequenceIsReassocOrLowRSSIOnly
{
  return self->_pingPongSequenceIsReassocOrLowRSSIOnly;
}

- (void)setPingPongSequenceIsReassocOrLowRSSIOnly:(BOOL)a3
{
  self->_pingPongSequenceIsReassocOrLowRSSIOnly = a3;
}

- (void).cxx_destruct
{
}

@end