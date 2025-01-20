@interface LogKCData
@end

@implementation LogKCData

const char *___LogKCData_block_invoke()
{
  result = getenv("SA_PRINT_STACKSHOTS");
  if (result || (result = getenv("SA_DEBUG_KCDATA_STACKSHOT_PRINT_ALL")) != 0)
  {
    result = (const char *)strcmp(result, "0");
    if (result) {
      byte_1EB698E81 = 1;
    }
  }
  return result;
}

@end