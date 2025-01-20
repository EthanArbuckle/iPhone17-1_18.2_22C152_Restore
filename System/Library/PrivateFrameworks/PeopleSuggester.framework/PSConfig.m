@interface PSConfig
@end

@implementation PSConfig

uint64_t __21___PSConfig__configs__block_invoke(uint64_t a1)
{
  uint64_t v2 = +[_PSConfig _loadPlistNamed:abortOnFailure:](*(void *)(a1 + 32), @"com.apple.PeopleSuggester.Config.Default", 1);
  v3 = (void *)_configs_configs;
  _configs_configs = v2;

  uint64_t v4 = +[_PSConfig _loadPlistNamed:abortOnFailure:](*(void *)(a1 + 32), @"com.apple.PeopleSuggester.MessagesPinning.Config", 1);
  v5 = (void *)qword_1EB4E5EB0;
  qword_1EB4E5EB0 = v4;

  uint64_t v6 = +[_PSConfig _loadPlistNamed:abortOnFailure:](*(void *)(a1 + 32), @"com.apple.PeopleSuggester.ContactEmbedding.Features", 1);
  v7 = (void *)qword_1EB4E5EB8;
  qword_1EB4E5EB8 = v6;

  qword_1EB4E5EC0 = +[_PSConfig _loadPlistNamed:abortOnFailure:](*(void *)(a1 + 32), @"vocab", 1);

  return MEMORY[0x1F41817F8]();
}

@end