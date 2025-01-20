@interface TRIXPCActivityCriteria
+ (id)cellularCriteria;
+ (id)clientTriggeredCellularCriteria;
+ (id)clientTriggeredWifiCriteria;
+ (id)fetchExperimentsCriteria;
+ (id)maintenanceCriteria;
@end

@implementation TRIXPCActivityCriteria

+ (id)cellularCriteria
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v2, (const char *)*MEMORY[0x1E4F142F8], 1);
  xpc_dictionary_set_int64(v2, (const char *)*MEMORY[0x1E4F141C8], 259200);
  xpc_dictionary_set_int64(v2, (const char *)*MEMORY[0x1E4F142F0], 3600);
  xpc_dictionary_set_string(v2, (const char *)*MEMORY[0x1E4F142C8], (const char *)*MEMORY[0x1E4F142D0]);
  xpc_dictionary_set_BOOL(v2, (const char *)*MEMORY[0x1E4F14138], 0);
  xpc_dictionary_set_BOOL(v2, (const char *)*MEMORY[0x1E4F14320], 1);
  xpc_dictionary_set_BOOL(v2, (const char *)*MEMORY[0x1E4F14338], 1);
  xpc_dictionary_set_BOOL(v2, (const char *)*MEMORY[0x1E4F14330], 0);
  return v2;
}

+ (id)fetchExperimentsCriteria
{
  xpc_object_t v2 = [a1 cellularCriteria];
  xpc_dictionary_set_int64(v2, (const char *)*MEMORY[0x1E4F141C8], 86400);
  xpc_dictionary_set_BOOL(v2, (const char *)*MEMORY[0x1E4F14330], 1);
  return v2;
}

+ (id)maintenanceCriteria
{
  xpc_object_t v2 = [a1 cellularCriteria];
  xpc_dictionary_set_BOOL(v2, (const char *)*MEMORY[0x1E4F14338], 0);
  xpc_dictionary_set_BOOL(v2, (const char *)*MEMORY[0x1E4F14330], 0);
  xpc_dictionary_set_int64(v2, (const char *)*MEMORY[0x1E4F141C8], 86400);
  return v2;
}

+ (id)clientTriggeredCellularCriteria
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v2, (const char *)*MEMORY[0x1E4F142F8], 0);
  xpc_dictionary_set_string(v2, (const char *)*MEMORY[0x1E4F142C8], (const char *)*MEMORY[0x1E4F142D0]);
  xpc_dictionary_set_BOOL(v2, (const char *)*MEMORY[0x1E4F14138], 0);
  xpc_dictionary_set_BOOL(v2, (const char *)*MEMORY[0x1E4F14320], 1);
  xpc_dictionary_set_BOOL(v2, (const char *)*MEMORY[0x1E4F14338], 1);
  xpc_dictionary_set_BOOL(v2, (const char *)*MEMORY[0x1E4F14330], 0);
  return v2;
}

+ (id)clientTriggeredWifiCriteria
{
  xpc_object_t v2 = [a1 clientTriggeredCellularCriteria];
  xpc_dictionary_set_BOOL(v2, (const char *)*MEMORY[0x1E4F14330], 1);
  return v2;
}

@end