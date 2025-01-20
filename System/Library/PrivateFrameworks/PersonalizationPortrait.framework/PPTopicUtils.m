@interface PPTopicUtils
+ (id)cachedTopicScoresAtPath:(id)a3;
@end

@implementation PPTopicUtils

+ (id)cachedTopicScoresAtPath:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v8 = 0;
  v3 = [MEMORY[0x1E4F93B50] dictionaryWithPath:a3 error:&v8];
  id v4 = v8;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v6 = pp_topics_log_handle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v10 = v4;
      _os_log_error_impl(&dword_18CAA6000, v6, OS_LOG_TYPE_ERROR, "Could not read Portrait topic cache plist: %@", buf, 0xCu);
    }
  }
  return v3;
}

@end