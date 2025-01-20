@interface NSXPCConnection(RTExtensions)
- (void)rejectInvocation:()RTExtensions withError:replyTypes:;
@end

@implementation NSXPCConnection(RTExtensions)

- (void)rejectInvocation:()RTExtensions withError:replyTypes:
{
  id v7 = a3;
  id v8 = a4;
  id v16 = v8;
  id v9 = a5;
  if (!v7)
  {
    v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    LOWORD(v15) = 0;
    v14 = "Invalid parameter not satisfying: invocation";
LABEL_11:
    _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, v14, (uint8_t *)&v15, 2u);
    goto LABEL_9;
  }
  if (!v8)
  {
    v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    LOWORD(v15) = 0;
    v14 = "Invalid parameter not satisfying: error";
    goto LABEL_11;
  }
  uint64_t v15 = 0;
  [v7 getArgument:&v15 atIndex:v7 blockArgumentIndex];
  v10 = [MEMORY[0x1E4F1CA38] signatureWithObjCTypes:[v9 UTF8String]];
  v11 = [MEMORY[0x1E4F1CA18] invocationWithMethodSignature:v10];
  uint64_t v12 = [v10 argumentIndexForClass:objc_opt_class()];
  if (v12 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v13 = v12;
    [v11 retainArguments];
    [v11 setArgument:&v16 atIndex:v13];
  }
  [v11 setTarget:v15];
  [v11 invoke];

LABEL_9:
}

@end