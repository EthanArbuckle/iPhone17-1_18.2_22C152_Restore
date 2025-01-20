@interface POXMLHelper
+ (id)loadXMLDocument:(id)a3;
@end

@implementation POXMLHelper

+ (id)loadXMLDocument:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(POXMLContext);
  id v5 = v3;
  v6 = (const char *)[v5 bytes];
  int v7 = [v5 length];

  [(POXMLContext *)v4 setXmldoc:xmlParseMemory(v6, v7)];
  if ([(POXMLContext *)v4 xmldoc])
  {
    v8 = v4;
  }
  else
  {
    v9 = PO_LOG_POXMLHelper();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      +[POXMLHelper loadXMLDocument:]();
    }

    v8 = 0;
  }

  return v8;
}

+ (void)loadXMLDocument:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_2(&dword_259DFE000, v0, v1, "Error: failed to parse xml document", v2, v3, v4, v5, v6);
}

@end