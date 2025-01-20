@interface REMXPCDaemonControllerPerformerResolver
- (NSString)name;
- (void)resolveWithDaemon:(id)a3 reason:(id)a4 completion:(id)a5;
@end

@implementation REMXPCDaemonControllerPerformerResolver

- (NSString)name
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  uint64_t v5 = objc_opt_class();
  v6 = NSStringFromSelector(a2);
  [v3 raise:v4, @"Abstract method called -[%@ %@]", v5, v6 format];

  return 0;
}

- (void)resolveWithDaemon:(id)a3 reason:(id)a4 completion:(id)a5
{
  v6 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v7 = *MEMORY[0x1E4F1C3B8];
  id v10 = a5;
  uint64_t v8 = objc_opt_class();
  v9 = NSStringFromSelector(a2);
  [v6 raise:v7, @"Abstract method called -[%@ %@]", v8, v9 format];

  (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
}

@end