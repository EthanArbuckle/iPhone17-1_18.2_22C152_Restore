@interface WiFiUsageLQMTriggerCriteria
+ (NSArray)dataTriggeredTypes;
+ (id)parseCriteria:(id)a3 intoRequiredFields:(id)a4 andFeatures:(id)a5 forFields:(id)a6 withType:(id)a7 isFilter:(BOOL)a8;
+ (id)predicateNoQuotes:(id)a3;
+ (void)initialize;
- (BOOL)matched;
- (BOOL)valid;
- (NSDate)currentSample;
- (NSDate)firstTriggered;
- (NSDate)lastTriggered;
- (NSPredicate)predicate;
- (NSPredicate)requiredFieldsValid;
- (NSString)bssid;
- (NSString)filterCriteria;
- (WiFiUsageLQMTriggerCriteria)initWith:(id)a3 forFields:(id)a4 andFeatures:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)redactedDescription;
- (id)shortPredicate;
- (id)shortPredicateNoSpaces;
- (id)typeAsString;
- (unint64_t)type;
- (void)setBssid:(id)a3;
- (void)setCurrentSample:(id)a3;
- (void)setFilterCriteria:(id)a3;
- (void)setFirstTriggered:(id)a3;
- (void)setLastTriggered:(id)a3;
- (void)setMatched:(BOOL)a3;
- (void)setPredicate:(id)a3;
- (void)setRequiredFieldsValid:(id)a3;
- (void)setType:(unint64_t)a3;
- (void)setValid:(BOOL)a3;
@end

@implementation WiFiUsageLQMTriggerCriteria

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (void)setMatched:(BOOL)a3
{
  self->_matched = a3;
}

- (void)setBssid:(id)a3
{
}

- (NSDate)lastTriggered
{
  return self->_lastTriggered;
}

- (NSDate)firstTriggered
{
  return self->_firstTriggered;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setCurrentSample:(id)a3
{
}

- (NSPredicate)requiredFieldsValid
{
  return self->_requiredFieldsValid;
}

+ (void)initialize
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v3 = (void *)_dateFormatter;
  _dateFormatter = (uint64_t)v2;

  v4 = (void *)_dateFormatter;

  [v4 setDateFormat:@"HH:mm:ss"];
}

+ (NSArray)dataTriggeredTypes
{
  return (NSArray *)&unk_1F2B95380;
}

- (WiFiUsageLQMTriggerCriteria)initWith:(id)a3 forFields:(id)a4 andFeatures:(id)a5
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v51 = a4;
  id v52 = a5;
  v54 = v7;
  v8 = [v7 objectForKey:@"type"];
  if (v8)
  {
    v9 = +[WiFiUsageLQMTriggerCriteria dataTriggeredTypes];
    v10 = [v7 objectForKey:@"type"];
    uint64_t v11 = [v9 indexOfObject:v10];

    if (v11 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v50 = objc_opt_new();
      v13 = objc_opt_class();
      v14 = [v7 objectForKey:@"type"];
      uint64_t v49 = [v13 parseCriteria:v7 intoRequiredFields:v50 andFeatures:v52 forFields:v51 withType:v14 isFilter:0];

      v15 = (void *)v49;
      if (!v49)
      {
        v12 = 0;
LABEL_30:

        goto LABEL_31;
      }
      objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:");
      v48 = (NSPredicate *)objc_claimAutoreleasedReturnValue();
      v16 = [v50 anyObject];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        v18 = objc_opt_new();
        long long v60 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        id v19 = v50;
        uint64_t v20 = [v19 countByEnumeratingWithState:&v60 objects:v65 count:16];
        if (v20)
        {
          uint64_t v21 = *(void *)v61;
          do
          {
            for (uint64_t i = 0; i != v20; ++i)
            {
              if (*(void *)v61 != v21) {
                objc_enumerationMutation(v19);
              }
              v23 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%@ != nil", *(void *)(*((void *)&v60 + 1) + 8 * i)];
              [v18 addObject:v23];
            }
            uint64_t v20 = [v19 countByEnumeratingWithState:&v60 objects:v65 count:16];
          }
          while (v20);
        }

        uint64_t v24 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v18];
      }
      else
      {
        v25 = [v50 anyObject];
        objc_opt_class();
        char v26 = objc_opt_isKindOfClass();

        if ((v26 & 1) == 0)
        {
          v35 = 0;
          goto LABEL_29;
        }
        v27 = objc_opt_new();
        long long v56 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        long long v59 = 0u;
        id v28 = v50;
        uint64_t v29 = [v28 countByEnumeratingWithState:&v56 objects:v64 count:16];
        if (v29)
        {
          uint64_t v30 = *(void *)v57;
          do
          {
            for (uint64_t j = 0; j != v29; ++j)
            {
              if (*(void *)v57 != v30) {
                objc_enumerationMutation(v28);
              }
              v32 = *(void **)(*((void *)&v56 + 1) + 8 * j);
              if ([v27 length]) {
                v33 = @" OR ";
              }
              else {
                v33 = &stru_1F2B5AC50;
              }
              v34 = [v32 fieldName];
              [v27 appendFormat:@"%@$x.fieldName == \"%@\"", v33, v34];
            }
            uint64_t v29 = [v28 countByEnumeratingWithState:&v56 objects:v64 count:16];
          }
          while (v29);
        }

        v18 = [MEMORY[0x1E4F28E78] stringWithFormat:@"SUBQUERY(SELF, $x, $x.median != nil AND (%@)).@count == %lu", v27, objc_msgSend(v28, "count")];

        uint64_t v24 = [MEMORY[0x1E4F28F60] predicateWithFormat:v18];
      }
      v35 = (NSPredicate *)v24;

LABEL_29:
      v55.receiver = self;
      v55.super_class = (Class)WiFiUsageLQMTriggerCriteria;
      v36 = [(WiFiUsageLQMTriggerCriteria *)&v55 init];
      v37 = +[WiFiUsageLQMTriggerCriteria dataTriggeredTypes];
      v38 = [v54 objectForKey:@"type"];
      v36->_type = [v37 indexOfObject:v38];

      predicate = v36->_predicate;
      v36->_predicate = v48;
      v40 = v48;

      requiredFieldsValid = v36->_requiredFieldsValid;
      v36->_requiredFieldsValid = v35;
      v42 = v35;

      v36->_matched = 0;
      firstTriggered = v36->_firstTriggered;
      v36->_firstTriggered = 0;

      lastTriggered = v36->_lastTriggered;
      v36->_lastTriggered = 0;

      currentSample = v36->_currentSample;
      v36->_currentSample = 0;

      bssid = v36->_bssid;
      v36->_bssid = 0;

      self = v36;
      v12 = self;
      v15 = (void *)v49;
      goto LABEL_30;
    }
  }
  NSLog(&cfstr_SFailedToParse_4.isa, "-[WiFiUsageLQMTriggerCriteria initWith:forFields:andFeatures:]", v7);
  NSLog(&cfstr_SFailedToParse_5.isa, "-[WiFiUsageLQMTriggerCriteria initWith:forFields:andFeatures:]", v7);
  v12 = 0;
LABEL_31:

  return v12;
}

- (id)typeAsString
{
  v3 = +[WiFiUsageLQMTriggerCriteria dataTriggeredTypes];
  v4 = [v3 objectAtIndexedSubscript:self->_type];

  return v4;
}

- (id)shortPredicate
{
  id v2 = self;
  id v3 = [(NSPredicate *)self->_predicate predicateFormat];
  v4 = (void *)MEMORY[0x1E4F28FD8];
  v5 = objc_msgSend(MEMORY[0x1E4F28FD8], "escapedPatternForString:", @"SUBQUERY(SELF, $x, $x.fieldName == \"");
  v6 = [v4 regularExpressionWithPattern:v5 options:1 error:0];

  id v7 = objc_msgSend(v6, "stringByReplacingMatchesInString:options:range:withTemplate:", v3, 0, 0, objc_msgSend(v3, "length"), &stru_1F2B5AC50);

  v8 = (void *)MEMORY[0x1E4F28FD8];
  v9 = [MEMORY[0x1E4F28FD8] escapedPatternForString:@"\" AND $x."];
  v10 = [v8 regularExpressionWithPattern:v9 options:1 error:0];

  uint64_t v11 = objc_msgSend(v10, "stringByReplacingMatchesInString:options:range:withTemplate:", v7, 0, 0, objc_msgSend(v7, "length"), @"_");

  v12 = (void *)MEMORY[0x1E4F28FD8];
  v13 = [MEMORY[0x1E4F28FD8] escapedPatternForString:@".@count > 0"]);
  v14 = [v12 regularExpressionWithPattern:v13 options:1 error:0];

  v15 = objc_msgSend(v14, "stringByReplacingMatchesInString:options:range:withTemplate:", v11, 0, 0, objc_msgSend(v11, "length"), &stru_1F2B5AC50);

  v16 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"(\\w+)_(\\w+)" options:1 error:0];

  v17 = objc_msgSend(v16, "stringByReplacingMatchesInString:options:range:withTemplate:", v15, 0, 0, objc_msgSend(v15, "length"), @"$2_$1");

  v18 = NSString;
  id v19 = [v2 filterCriteria];
  if (v19)
  {
    uint64_t v20 = NSString;
    id v2 = [v2 filterCriteria];
    uint64_t v21 = [v20 stringWithFormat:@" (where %@)", v2];
  }
  else
  {
    uint64_t v21 = &stru_1F2B5AC50;
  }
  v22 = [v18 stringWithFormat:@"%@%@", v17, v21];

  if (v19)
  {
  }

  return v22;
}

- (id)shortPredicateNoSpaces
{
  id v2 = [(WiFiUsageLQMTriggerCriteria *)self shortPredicate];
  id v3 = (void *)MEMORY[0x1E4F28FD8];
  v4 = [MEMORY[0x1E4F28FD8] escapedPatternForString:@" "];
  v5 = [v3 regularExpressionWithPattern:v4 options:1 error:0];

  v6 = objc_msgSend(v5, "stringByReplacingMatchesInString:options:range:withTemplate:", v2, 0, 0, objc_msgSend(v2, "length"), &stru_1F2B5AC50);

  return v6;
}

+ (id)predicateNoQuotes:(id)a3
{
  id v3 = [a3 predicateFormat];
  v4 = (void *)MEMORY[0x1E4F28FD8];
  v5 = [MEMORY[0x1E4F28FD8] escapedPatternForString:@"\""];
  v6 = [v4 regularExpressionWithPattern:v5 options:1 error:0];

  id v7 = objc_msgSend(v6, "stringByReplacingMatchesInString:options:range:withTemplate:", v3, 0, 0, objc_msgSend(v3, "length"), &stru_1F2B5AC50);

  return v7;
}

- (id)description
{
  id v3 = (void *)0x1E4F29000;
  v4 = NSString;
  v5 = [(WiFiUsageLQMTriggerCriteria *)self shortPredicate];
  uint64_t v21 = v4;
  if (self->_valid)
  {
    if (self->_matched) {
      v6 = @"True";
    }
    else {
      v6 = @"False";
    }
  }
  else
  {
    v6 = @"N/A";
  }
  bssid = self->_bssid;
  v8 = NSString;
  firstTriggered = self->_firstTriggered;
  if (firstTriggered)
  {
    BOOL v20 = _dateFormatter != 0;
    if (_dateFormatter)
    {
      uint64_t v10 = [(id)_dateFormatter stringFromDate:firstTriggered];
    }
    else
    {
      uint64_t v10 = (uint64_t)self->_firstTriggered;
    }
    id v19 = (void *)v10;
    uint64_t v11 = [v8 stringWithFormat:@"triggering since %@", v10];
  }
  else
  {
    BOOL v20 = 0;
    uint64_t v11 = &stru_1F2B5AC50;
  }
  lastTriggered = self->_lastTriggered;
  if (lastTriggered)
  {
    v13 = NSString;
    BOOL v14 = _dateFormatter != 0;
    if (_dateFormatter)
    {
      id v3 = [(id)_dateFormatter stringFromDate:lastTriggered];
    }
    else
    {
      id v3 = lastTriggered;
    }
    v15 = [v13 stringWithFormat:@"until %@", v3];
  }
  else
  {
    BOOL v14 = 0;
    v15 = &stru_1F2B5AC50;
  }
  v16 = [v8 stringWithFormat:@"%@ %@", v11, v15];
  v17 = [v21 stringWithFormat:@"%@ on %@ matched:%@ %@", v5, bssid, v6, v16];

  if (lastTriggered) {
  if (v14)
  }

  if (firstTriggered) {
  if (v20)
  }

  return v17;
}

- (id)redactedDescription
{
  id v3 = (void *)0x1E4F29000;
  v4 = NSString;
  v5 = [(WiFiUsageLQMTriggerCriteria *)self shortPredicate];
  if (self->_valid)
  {
    if (self->_matched) {
      v6 = @"True";
    }
    else {
      v6 = @"False";
    }
  }
  else
  {
    v6 = @"N/A";
  }
  id v7 = NSString;
  firstTriggered = self->_firstTriggered;
  if (firstTriggered)
  {
    BOOL v19 = _dateFormatter != 0;
    if (_dateFormatter)
    {
      uint64_t v9 = [(id)_dateFormatter stringFromDate:firstTriggered];
    }
    else
    {
      uint64_t v9 = (uint64_t)self->_firstTriggered;
    }
    v18 = (void *)v9;
    uint64_t v10 = [v7 stringWithFormat:@"triggering since %@", v9];
  }
  else
  {
    BOOL v19 = 0;
    uint64_t v10 = &stru_1F2B5AC50;
  }
  lastTriggered = self->_lastTriggered;
  if (lastTriggered)
  {
    v12 = NSString;
    BOOL v13 = _dateFormatter != 0;
    if (_dateFormatter)
    {
      id v3 = [(id)_dateFormatter stringFromDate:lastTriggered];
    }
    else
    {
      id v3 = lastTriggered;
    }
    BOOL v14 = [v12 stringWithFormat:@"until %@", v3];
  }
  else
  {
    BOOL v13 = 0;
    BOOL v14 = &stru_1F2B5AC50;
  }
  v15 = [v7 stringWithFormat:@"%@ %@", v10, v14];
  v16 = [v4 stringWithFormat:@"%@ on <redacted> matched:%@ %@", v5, v6, v15];

  if (lastTriggered) {
  if (v13)
  }

  if (firstTriggered) {
  if (v19)
  }

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_opt_new();
  [v4 setType:self->_type];
  [v4 setPredicate:self->_predicate];
  [v4 setRequiredFieldsValid:self->_requiredFieldsValid];
  [v4 setValid:self->_valid];
  [v4 setMatched:self->_matched];
  [v4 setFirstTriggered:self->_firstTriggered];
  [v4 setLastTriggered:self->_lastTriggered];
  [v4 setCurrentSample:self->_currentSample];
  [v4 setBssid:self->_bssid];
  [v4 setFilterCriteria:self->_filterCriteria];
  return v4;
}

+ (id)parseCriteria:(id)a3 intoRequiredFields:(id)a4 andFeatures:(id)a5 forFields:(id)a6 withType:(id)a7 isFilter:(BOOL)a8
{
  BOOL v8 = a8;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v57 = a6;
  v16 = (__CFString *)a7;
  v17 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"AND", @"&&", @"OR", @"||", 0);
  v18 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"NOT", @"!", 0);
  BOOL v19 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"=", @"==", @">=", @"=>", @"<=", @"=<", @">", @"<", @"!=", @"<>", @"contains", 0);
  BOOL v20 = [v13 objectForKey:@"test"];

  if (!v20)
  {
    v22 = v17;
    v23 = v19;
    NSLog(&cfstr_SFailedToParse_6.isa, "+[WiFiUsageLQMTriggerCriteria parseCriteria:intoRequiredFields:andFeatures:forFields:withType:isFilter:]", v13);
    v32 = 0;
    uint64_t v30 = v14;
    goto LABEL_49;
  }
  uint64_t v21 = [v13 objectForKey:@"test"];
  BOOL v54 = v8;
  if (([v18 containsObject:v21] & 1) == 0 && !objc_msgSend(v17, "containsObject:", v21))
  {
    uint64_t v30 = v14;
    if ([v19 containsObject:v21]
      && ([v13 objectForKey:@"field"],
          v33 = objc_claimAutoreleasedReturnValue(),
          v33,
          v33))
    {
      id v51 = [v13 objectForKey:@"threshold"];
      v34 = [v13 objectForKey:@"field"];
      if ([v34 hasSuffix:@"PerSecond"])
      {
        uint64_t v35 = [v34 substringToIndex:objc_msgSend(v34, "length") - objc_msgSend(@"PerSecond", "length")];

        v34 = (void *)v35;
      }
      if ([v57 containsObject:v34])
      {
        v53 = v15;
        uint64_t v49 = v34;
        if (v54)
        {

          v16 = @"value";
        }
        v22 = v17;
        v36 = +[WiFiUsageLQMTriggerCriteria dataTriggeredTypes];
        uint64_t v37 = [v36 indexOfObject:v16];

        v23 = v19;
        if (!v37)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v47 = @"%@ %@ '%@'";
          }
          else {
            v47 = @"%@ %@ %@";
          }
          v39 = v49;
          v32 = objc_msgSend(NSString, "stringWithFormat:", v47, v49, v21, v51);
          id v15 = v53;
          if (v30) {
            [v30 addObject:v49];
          }
          goto LABEL_43;
        }
        id v15 = v53;
        if (v37 == 1)
        {
          v32 = [NSString stringWithFormat:@"SUBQUERY(SELF,$x,$x.fieldName == \"%@\" AND $x.median %@ %@).@count > 0", v49, v21, v51];
          v38 = [[WiFiUsageLQMFeature alloc] initWithField:v49 andPerSecond:+[WiFiUsageLQMSample isPerSecond:v49]];
          if (v53) {
            [v53 addObject:v38];
          }
          if (v30) {
            [v30 addObject:v38];
          }

          v39 = v49;
          goto LABEL_43;
        }
        NSLog(&cfstr_SFailedToParse_12.isa, "+[WiFiUsageLQMTriggerCriteria parseCriteria:intoRequiredFields:andFeatures:forFields:withType:isFilter:]", v13);
        v45 = v49;
        v46 = v51;
      }
      else
      {
        v22 = v17;
        v23 = v19;
        NSLog(&cfstr_SFailedToParse_11.isa, "+[WiFiUsageLQMTriggerCriteria parseCriteria:intoRequiredFields:andFeatures:forFields:withType:isFilter:]", v34, v13);
        v45 = v34;
        v46 = v51;
      }
    }
    else
    {
      v22 = v17;
      v23 = v19;
      NSLog(&cfstr_SFailedToParse_10.isa, "+[WiFiUsageLQMTriggerCriteria parseCriteria:intoRequiredFields:andFeatures:forFields:withType:isFilter:]", v13);
    }
LABEL_47:
    v32 = 0;
    goto LABEL_48;
  }
  v22 = v17;
  v23 = v19;
  uint64_t v24 = [v13 objectForKey:@"conditions"];
  if (v24)
  {
    v25 = (void *)v24;
    [v13 objectForKey:@"conditions"];
    char v26 = v52 = v15;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    id v15 = v52;
    if (isKindOfClass)
    {
      id v28 = [v13 objectForKey:@"conditions"];
      if ([v18 containsObject:v21])
      {
        if ([v28 count] == 1)
        {
          uint64_t v29 = [v28 objectAtIndexedSubscript:0];
          uint64_t v30 = v14;
          v31 = [a1 parseCriteria:v29 intoRequiredFields:v14 andFeatures:v52 forFields:v57 withType:v16 isFilter:v54];

          id v15 = v52;
          if (v31)
          {
            id v51 = v28;
            v32 = [NSString stringWithFormat:@"%@(%@)", v21, v31];

            goto LABEL_28;
          }
        }
        else
        {
          NSLog(&cfstr_SFailedToParse_8.isa, "+[WiFiUsageLQMTriggerCriteria parseCriteria:intoRequiredFields:andFeatures:forFields:withType:isFilter:]", v21, [v28 count], v13);
          uint64_t v30 = v14;
        }
LABEL_37:

        goto LABEL_47;
      }
      id v51 = v28;
      v32 = 0;
      uint64_t v30 = v14;
LABEL_28:
      if (![v22 containsObject:v21])
      {
LABEL_44:

        goto LABEL_48;
      }
      if ([v51 count] == 2)
      {
        uint64_t v40 = [v51 objectAtIndexedSubscript:0];
        id v41 = v15;
        v42 = (void *)v40;
        v50 = [a1 parseCriteria:v40 intoRequiredFields:v30 andFeatures:v41 forFields:v57 withType:v16 isFilter:v54];

        v43 = [v51 objectAtIndexedSubscript:1];
        v44 = [a1 parseCriteria:v43 intoRequiredFields:v30 andFeatures:v52 forFields:v57 withType:v16 isFilter:v54];

        if (v50 && v44)
        {
          uint64_t v56 = [NSString stringWithFormat:@"( %@) %@(%@)", v50, v21, v44];

          v39 = v50;
          v32 = (void *)v56;
          id v15 = v52;
LABEL_43:

          goto LABEL_44;
        }

        id v28 = v51;
        id v15 = v52;
      }
      else
      {
        NSLog(&cfstr_SFailedToParse_9.isa, "+[WiFiUsageLQMTriggerCriteria parseCriteria:intoRequiredFields:andFeatures:forFields:withType:isFilter:]", v21, [v51 count]);

        id v28 = v51;
      }
      goto LABEL_37;
    }
  }
  NSLog(&cfstr_SFailedToParse_7.isa, "+[WiFiUsageLQMTriggerCriteria parseCriteria:intoRequiredFields:andFeatures:forFields:withType:isFilter:]", v13);
  v32 = 0;
  uint64_t v30 = v14;
LABEL_48:

LABEL_49:

  return v32;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (void)setPredicate:(id)a3
{
}

- (void)setRequiredFieldsValid:(id)a3
{
}

- (BOOL)valid
{
  return self->_valid;
}

- (BOOL)matched
{
  return self->_matched;
}

- (void)setFirstTriggered:(id)a3
{
}

- (void)setLastTriggered:(id)a3
{
}

- (NSDate)currentSample
{
  return self->_currentSample;
}

- (NSString)bssid
{
  return self->_bssid;
}

- (NSString)filterCriteria
{
  return self->_filterCriteria;
}

- (void)setFilterCriteria:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filterCriteria, 0);
  objc_storeStrong((id *)&self->_bssid, 0);
  objc_storeStrong((id *)&self->_currentSample, 0);
  objc_storeStrong((id *)&self->_lastTriggered, 0);
  objc_storeStrong((id *)&self->_firstTriggered, 0);
  objc_storeStrong((id *)&self->_requiredFieldsValid, 0);

  objc_storeStrong((id *)&self->_predicate, 0);
}

@end