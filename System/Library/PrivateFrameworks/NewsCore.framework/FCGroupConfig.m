@interface FCGroupConfig
- (FCColor)groupDarkStyleTitleColor;
- (FCColor)groupTitleColor;
- (FCColorGradient)groupBackgroundColorGradient;
- (FCColorGradient)groupDarkStyleBackgroundColorGradient;
- (FCGroupConfig)initWithDictionary:(id)a3;
- (NSArray)groupFonts;
- (NSDictionary)articleMetadataByArticleID;
- (NSDictionary)dictionary;
- (NSString)articleListID;
- (NSString)channelID;
- (NSString)feedID;
- (NSString)groupActionTitle;
- (NSString)groupActionURLString;
- (NSString)groupName;
- (NSString)groupSubtitle;
- (NSString)groupTitleFontName;
- (NSString)sectionID;
- (double)groupTitleFontSize;
- (double)groupTitleFontSizeiPad;
- (double)groupTitleFontTracking;
- (double)groupTitleFontTrackingiPad;
- (double)groupTitleOffsetHeight;
- (double)groupTitleOffsetHeightiPad;
- (double)groupTitleOffsetY;
- (double)groupTitleOffsetYiPad;
- (unint64_t)cutoffCount;
- (unint64_t)cutoffTimeSecs;
- (void)setArticleMetadataByArticleID:(id)a3;
- (void)setCutoffCount:(unint64_t)a3;
- (void)setCutoffTimeSecs:(unint64_t)a3;
- (void)setDictionary:(id)a3;
- (void)setGroupBackgroundColorGradient:(id)a3;
- (void)setGroupDarkStyleBackgroundColorGradient:(id)a3;
- (void)setGroupDarkStyleTitleColor:(id)a3;
- (void)setGroupFonts:(id)a3;
- (void)setGroupTitleColor:(id)a3;
@end

@implementation FCGroupConfig

- (FCGroupConfig)initWithDictionary:(id)a3
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v54.receiver = self;
  v54.super_class = (Class)FCGroupConfig;
  v5 = [(FCGroupConfig *)&v54 init];
  if (v5)
  {
    id v6 = v4;
    v7 = [v6 objectForKeyedSubscript:@"scheduledContent"];
    uint64_t v8 = [v7 objectForKeyedSubscript:@"scheduledLocalDate"];
    if (v7) {
      BOOL v9 = v8 == 0;
    }
    else {
      BOOL v9 = 1;
    }
    id v47 = v4;
    v43 = (void *)v8;
    v44 = v7;
    if (!v9)
    {
      uint64_t v10 = v8;
      v11 = [MEMORY[0x1E4F28C10] dateFormatterWithFormat:@"yyyy-MM-dd'T'HH:mm:ss" forReuse:0];
      v12 = [v11 dateFromString:v10];

      if (v12)
      {
        v13 = [MEMORY[0x1E4F1C9C8] date];
        int v14 = objc_msgSend(v13, "fc_isLaterThan:", v12);

        if (v14)
        {
          uint64_t v15 = objc_msgSend(MEMORY[0x1E4F1C9E8], "fc_dictionaryByAddingEntriesFromDictionary:toDictionary:", v7, v6);

          id v6 = (id)v15;
        }
      }
    }
    v45 = v6;
    uint64_t v16 = [v6 copy];
    dictionary = v5->_dictionary;
    v5->_dictionary = (NSDictionary *)v16;

    v18 = [(FCGroupConfig *)v5 dictionary];
    v19 = [v18 objectForKeyedSubscript:@"groupTitleColor"];
    uint64_t v20 = +[FCColor colorWithHexString:v19];
    groupTitleColor = v5->_groupTitleColor;
    v5->_groupTitleColor = (FCColor *)v20;

    v22 = [(FCGroupConfig *)v5 dictionary];
    v23 = [v22 objectForKeyedSubscript:@"groupAlternateTitleColor"];
    uint64_t v24 = +[FCColor colorWithHexString:v23];
    groupDarkStyleTitleColor = v5->_groupDarkStyleTitleColor;
    v5->_groupDarkStyleTitleColor = (FCColor *)v24;

    v26 = [(FCGroupConfig *)v5 dictionary];
    v27 = [v26 objectForKeyedSubscript:@"cutoffTimeSecs"];
    v5->_cutoffTimeSecs = [v27 unsignedIntegerValue];

    v28 = [(FCGroupConfig *)v5 dictionary];
    v29 = [v28 objectForKeyedSubscript:@"cutoffCount"];
    v5->_cutoffCount = [v29 unsignedIntegerValue];

    v49 = [MEMORY[0x1E4F1CA48] array];
    v46 = v5;
    v30 = [(FCGroupConfig *)v5 dictionary];
    v31 = [v30 objectForKeyedSubscript:@"groupFonts"];

    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id obj = v31;
    uint64_t v32 = [obj countByEnumeratingWithState:&v50 objects:v55 count:16];
    if (v32)
    {
      uint64_t v33 = v32;
      uint64_t v34 = *(void *)v51;
      do
      {
        uint64_t v35 = 0;
        do
        {
          if (*(void *)v51 != v34) {
            objc_enumerationMutation(obj);
          }
          v36 = *(void **)(*((void *)&v50 + 1) + 8 * v35);
          v37 = [FCGroupFont alloc];
          v38 = [v36 objectForKeyedSubscript:@"name"];
          v39 = [v36 objectForKeyedSubscript:@"url"];
          v40 = [(FCGroupFont *)v37 initWithName:v38 urlString:v39];

          if (v40) {
            [(NSArray *)v49 addObject:v40];
          }

          ++v35;
        }
        while (v33 != v35);
        uint64_t v33 = [obj countByEnumeratingWithState:&v50 objects:v55 count:16];
      }
      while (v33);
    }

    v5 = v46;
    groupFonts = v46->_groupFonts;
    v46->_groupFonts = v49;

    id v4 = v47;
  }

  return v5;
}

- (NSString)articleListID
{
  v2 = [(FCGroupConfig *)self dictionary];
  v3 = [v2 objectForKeyedSubscript:@"articleListID"];

  return (NSString *)v3;
}

- (NSString)groupName
{
  v2 = [(FCGroupConfig *)self dictionary];
  v3 = [v2 objectForKeyedSubscript:@"groupName"];

  return (NSString *)v3;
}

- (NSString)groupSubtitle
{
  v2 = [(FCGroupConfig *)self dictionary];
  v3 = [v2 objectForKeyedSubscript:@"groupSubtitle"];

  return (NSString *)v3;
}

- (NSString)groupTitleFontName
{
  v2 = [(FCGroupConfig *)self dictionary];
  v3 = [v2 objectForKeyedSubscript:@"groupTitleFontName"];

  return (NSString *)v3;
}

- (double)groupTitleFontSize
{
  v3 = [(FCGroupConfig *)self dictionary];
  id v4 = [v3 objectForKeyedSubscript:@"groupTitleFontSize"];

  if (!v4) {
    return 1.79769313e308;
  }
  v5 = [(FCGroupConfig *)self dictionary];
  id v6 = [v5 objectForKeyedSubscript:@"groupTitleFontSize"];
  [v6 floatValue];
  double v8 = v7;

  return v8;
}

- (double)groupTitleOffsetY
{
  v2 = [(FCGroupConfig *)self dictionary];
  v3 = [v2 objectForKeyedSubscript:@"groupTitleOffsetY"];
  [v3 floatValue];
  double v5 = v4;

  return v5;
}

- (double)groupTitleOffsetYiPad
{
  v2 = [(FCGroupConfig *)self dictionary];
  v3 = [v2 objectForKeyedSubscript:@"groupTitleOffsetYiPad"];
  [v3 floatValue];
  double v5 = v4;

  return v5;
}

- (double)groupTitleOffsetHeight
{
  v2 = [(FCGroupConfig *)self dictionary];
  v3 = [v2 objectForKeyedSubscript:@"groupTitleOffsetHeight"];
  [v3 floatValue];
  double v5 = v4;

  return v5;
}

- (double)groupTitleOffsetHeightiPad
{
  v2 = [(FCGroupConfig *)self dictionary];
  v3 = [v2 objectForKeyedSubscript:@"groupTitleOffsetHeightiPad"];
  [v3 floatValue];
  double v5 = v4;

  return v5;
}

- (double)groupTitleFontSizeiPad
{
  v3 = [(FCGroupConfig *)self dictionary];
  float v4 = [v3 objectForKeyedSubscript:@"groupTitleFontSizeiPad"];

  if (!v4) {
    return 1.79769313e308;
  }
  double v5 = [(FCGroupConfig *)self dictionary];
  id v6 = [v5 objectForKeyedSubscript:@"groupTitleFontSizeiPad"];
  [v6 floatValue];
  double v8 = v7;

  return v8;
}

- (double)groupTitleFontTracking
{
  v3 = [(FCGroupConfig *)self dictionary];
  float v4 = [v3 objectForKeyedSubscript:@"groupTitleFontTracking"];

  if (!v4) {
    return 1.79769313e308;
  }
  double v5 = [(FCGroupConfig *)self dictionary];
  id v6 = [v5 objectForKeyedSubscript:@"groupTitleFontTracking"];
  [v6 floatValue];
  double v8 = v7;

  return v8;
}

- (double)groupTitleFontTrackingiPad
{
  v3 = [(FCGroupConfig *)self dictionary];
  float v4 = [v3 objectForKeyedSubscript:@"groupTitleFontTrackingiPad"];

  if (!v4) {
    return 1.79769313e308;
  }
  double v5 = [(FCGroupConfig *)self dictionary];
  id v6 = [v5 objectForKeyedSubscript:@"groupTitleFontTrackingiPad"];
  [v6 floatValue];
  double v8 = v7;

  return v8;
}

- (NSString)groupActionTitle
{
  v2 = [(FCGroupConfig *)self dictionary];
  v3 = [v2 objectForKeyedSubscript:@"groupActionTitle"];

  return (NSString *)v3;
}

- (NSString)groupActionURLString
{
  v2 = [(FCGroupConfig *)self dictionary];
  v3 = [v2 objectForKeyedSubscript:@"groupActionUrl"];

  return (NSString *)v3;
}

- (NSString)sectionID
{
  v2 = [(FCGroupConfig *)self dictionary];
  v3 = [v2 objectForKeyedSubscript:@"sectionID"];

  return (NSString *)v3;
}

- (NSString)channelID
{
  v2 = [(FCGroupConfig *)self dictionary];
  v3 = [v2 objectForKeyedSubscript:@"channelID"];

  return (NSString *)v3;
}

- (NSString)feedID
{
  v2 = [(FCGroupConfig *)self dictionary];
  v3 = [v2 objectForKeyedSubscript:@"feedID"];

  return (NSString *)v3;
}

- (FCColor)groupTitleColor
{
  return self->_groupTitleColor;
}

- (void)setGroupTitleColor:(id)a3
{
}

- (FCColor)groupDarkStyleTitleColor
{
  return self->_groupDarkStyleTitleColor;
}

- (void)setGroupDarkStyleTitleColor:(id)a3
{
}

- (NSArray)groupFonts
{
  return self->_groupFonts;
}

- (void)setGroupFonts:(id)a3
{
}

- (unint64_t)cutoffTimeSecs
{
  return self->_cutoffTimeSecs;
}

- (void)setCutoffTimeSecs:(unint64_t)a3
{
  self->_cutoffTimeSecs = a3;
}

- (unint64_t)cutoffCount
{
  return self->_cutoffCount;
}

- (void)setCutoffCount:(unint64_t)a3
{
  self->_cutoffCount = a3;
}

- (FCColorGradient)groupBackgroundColorGradient
{
  return self->_groupBackgroundColorGradient;
}

- (void)setGroupBackgroundColorGradient:(id)a3
{
}

- (FCColorGradient)groupDarkStyleBackgroundColorGradient
{
  return self->_groupDarkStyleBackgroundColorGradient;
}

- (void)setGroupDarkStyleBackgroundColorGradient:(id)a3
{
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (void)setDictionary:(id)a3
{
}

- (NSDictionary)articleMetadataByArticleID
{
  return self->_articleMetadataByArticleID;
}

- (void)setArticleMetadataByArticleID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_articleMetadataByArticleID, 0);
  objc_storeStrong((id *)&self->_dictionary, 0);
  objc_storeStrong((id *)&self->_groupDarkStyleBackgroundColorGradient, 0);
  objc_storeStrong((id *)&self->_groupBackgroundColorGradient, 0);
  objc_storeStrong((id *)&self->_groupFonts, 0);
  objc_storeStrong((id *)&self->_groupDarkStyleTitleColor, 0);
  objc_storeStrong((id *)&self->_groupTitleColor, 0);
}

@end