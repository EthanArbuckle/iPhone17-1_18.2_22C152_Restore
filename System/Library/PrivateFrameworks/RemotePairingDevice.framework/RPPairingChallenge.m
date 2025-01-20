@interface RPPairingChallenge
- (BOOL)lastAttemptIncorrect;
- (NSNumber)throttledBy;
- (RPPairingChallenge)init;
- (void)answerWithPIN:(id)a3;
- (void)cancel;
@end

@implementation RPPairingChallenge

- (BOOL)lastAttemptIncorrect
{
  return sub_1D75B3F44() & 1;
}

- (NSNumber)throttledBy
{
  v2 = self;
  v3 = (void *)sub_1D75B3F9C();

  return (NSNumber *)v3;
}

- (void)answerWithPIN:(id)a3
{
  uint64_t v4 = sub_1D7660B10();
  uint64_t v6 = v5;
  v7 = self;
  sub_1D75B3FD4(v4, v6);

  swift_bridgeObjectRelease();
}

- (void)cancel
{
  v2 = self;
  sub_1D75B409C();
}

- (RPPairingChallenge)init
{
}

- (void).cxx_destruct
{
}

@end