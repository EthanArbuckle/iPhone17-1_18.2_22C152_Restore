@interface PASArgParser
@end

@implementation PASArgParser

uint64_t __63___PASArgParser_simpleParserWithHelpGenerator_version_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 options];
  v5 = [v4 objectForKeyedSubscript:@"help"];

  if (v5)
  {
    uint64_t v6 = *(void *)(a1 + 40);
    if (v6)
    {
      v7 = (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
    }
    else
    {
      v13 = [v3 parser];
      v7 = [v13 naiveUsageHelpWithPositionalArgString:0];
    }
    id v14 = v7;
    printf("%s", (const char *)[v14 UTF8String]);

    goto LABEL_9;
  }
  v8 = [v3 options];
  v9 = [v8 objectForKeyedSubscript:@"version"];
  if (!v9)
  {

    goto LABEL_11;
  }
  uint64_t v10 = *(void *)(a1 + 32);

  if (!v10)
  {
LABEL_11:
    uint64_t v15 = (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
    goto LABEL_12;
  }
  v11 = [MEMORY[0x1E4F28F80] processInfo];
  id v12 = [v11 processName];
  printf("%s %s\n", (const char *)[v12 UTF8String], (const char *)objc_msgSend(*(id *)(a1 + 32), "UTF8String"));

LABEL_9:
  uint64_t v15 = 0;
LABEL_12:

  return v15;
}

@end