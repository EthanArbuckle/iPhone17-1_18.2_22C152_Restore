@interface PASArgSubcommand
@end

@implementation PASArgSubcommand

uint64_t __73___PASArgSubcommand_simpleSubcommandWithHelpGenerator_name_help_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 options];
  v5 = [v4 objectForKeyedSubscript:@"help"];

  if (v5)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    if (v6)
    {
      v7 = (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
    }
    else
    {
      v9 = [v3 subcommand];
      v7 = [v9 naiveUsageHelpWithPositionalArgString:0];
    }
    id v10 = v7;
    printf("%s", (const char *)[v10 UTF8String]);

    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v8 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }

  return v8;
}

@end