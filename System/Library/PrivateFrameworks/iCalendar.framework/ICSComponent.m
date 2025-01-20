@interface ICSComponent
+ (id)inheritanceKeywords;
+ (id)makeUID;
+ (id)name;
+ (id)stringFromRelationshipType:(unint64_t)a3;
+ (id)stringFromStatus:(int)a3;
+ (int)statusFromString:(id)a3;
+ (unint64_t)relationshipTypeFromString:(id)a3;
- (BOOL)forcedAllDay;
- (BOOL)ignorePropertyWithName:(id)a3;
- (BOOL)isAllDay;
- (BOOL)shouldObscureParameter:(id)a3;
- (BOOL)shouldObscureValue;
- (BOOL)validate:(id *)a3;
- (BOOL)x_apple_ews_needsserverconfirmation;
- (BOOL)x_apple_ignore_on_restore;
- (BOOL)x_apple_suggestionInfoChangesAcknowledged;
- (ICSComponent)init;
- (ICSDate)created;
- (ICSDate)dtend;
- (ICSDate)dtstamp;
- (ICSDate)dtstart;
- (ICSDate)last_modified;
- (ICSDate)recurrence_id;
- (ICSDate)x_apple_suggestionInfoTimestamp;
- (ICSDuration)duration;
- (ICSStructuredLocation)x_apple_structured_location;
- (ICSTrigger)trigger;
- (ICSUserAddress)organizer;
- (NSArray)attach;
- (NSArray)attendee;
- (NSArray)conferences;
- (NSArray)exdate;
- (NSArray)exrule;
- (NSArray)rdate;
- (NSArray)relatedTo;
- (NSArray)rrule;
- (NSMutableArray)components;
- (NSSet)propertiesToExcludeForChecksum;
- (NSString)description;
- (NSString)location;
- (NSString)statusString;
- (NSString)summary;
- (NSString)uid;
- (NSString)unrecognizedComponentName;
- (NSString)x_apple_contactIdentifiers;
- (NSString)x_apple_dropbox;
- (NSString)x_apple_etag;
- (NSString)x_apple_ews_changekey;
- (NSString)x_apple_ews_itemid;
- (NSString)x_apple_ews_permission;
- (NSString)x_apple_relatedExternalID;
- (NSString)x_apple_scheduletag;
- (NSString)x_apple_serverFilename;
- (NSString)x_apple_suggestionInfoOpaqueKey;
- (NSString)x_apple_suggestionInfoUniqueKey;
- (NSString)x_apple_universalID;
- (NSURL)url;
- (id)ICSStringWithOptions:(unint64_t)a3;
- (id)allProperties;
- (id)debugDescription;
- (id)properties;
- (id)propertiesForName:(id)a3;
- (id)propertiesToHide;
- (id)propertiesToObscure;
- (id)x_apple_end_location;
- (id)x_apple_travel_advisory_behavior;
- (id)x_apple_travel_duration;
- (id)x_apple_travel_start;
- (int)classification;
- (int)status;
- (int)x_calendarserver_access;
- (unint64_t)priority;
- (unint64_t)sequence;
- (unint64_t)x_apple_suggestionInfoChangedFields;
- (void)ICSStringWithOptions:(unint64_t)a3 appendingToString:(id)a4;
- (void)addComponent:(id)a3 withUIDGenerator:(id)a4;
- (void)addProperty:(id)a3 withValue:(id)a4;
- (void)fixAlarms;
- (void)fixAttachments;
- (void)fixAttendees;
- (void)fixComponent;
- (void)fixExceptionDates;
- (void)fixExceptionRules;
- (void)fixPropertiesInheritance:(id)a3;
- (void)fixRecurrenceDates;
- (void)fixRecurrenceRules;
- (void)fixRelatedTo;
- (void)fixSuggestionInfo;
- (void)removeComponent:(id)a3;
- (void)removePropertiesForName:(id)a3;
- (void)setAttach:(id)a3;
- (void)setAttendee:(id)a3;
- (void)setClassification:(int)a3;
- (void)setComponents:(id)a3;
- (void)setConferences:(id)a3;
- (void)setCreated:(id)a3;
- (void)setDescription:(id)a3;
- (void)setDtend:(id)a3;
- (void)setDtstamp:(id)a3;
- (void)setDtstart:(id)a3;
- (void)setDuration:(id)a3;
- (void)setExdate:(id)a3;
- (void)setExrule:(id)a3;
- (void)setForcedAllDay:(BOOL)a3;
- (void)setLast_modified:(id)a3;
- (void)setLocation:(id)a3;
- (void)setOrganizer:(id)a3;
- (void)setPriority:(unint64_t)a3;
- (void)setProperties:(id)a3 forName:(id)a4;
- (void)setProperty:(id)a3 forName:(id)a4;
- (void)setPropertyValue:(id)a3 forName:(id)a4;
- (void)setPropertyValue:(id)a3 type:(int)a4 forName:(id)a5;
- (void)setRdate:(id)a3;
- (void)setRecurrence_id:(id)a3;
- (void)setRelatedTo:(id)a3;
- (void)setRrule:(id)a3;
- (void)setSequence:(unint64_t)a3;
- (void)setStatus:(int)a3;
- (void)setStatusString:(id)a3;
- (void)setSummary:(id)a3;
- (void)setTrigger:(id)a3;
- (void)setUid:(id)a3;
- (void)setUnrecognizedComponentName:(id)a3;
- (void)setUrl:(id)a3;
- (void)setX_apple_contactIdentifiers:(id)a3;
- (void)setX_apple_dropbox:(id)a3;
- (void)setX_apple_end_location:(id)a3;
- (void)setX_apple_etag:(id)a3;
- (void)setX_apple_ews_changekey:(id)a3;
- (void)setX_apple_ews_itemid:(id)a3;
- (void)setX_apple_ews_needsserverconfirmation:(BOOL)a3;
- (void)setX_apple_ews_permission:(id)a3;
- (void)setX_apple_ignore_on_restore:(BOOL)a3;
- (void)setX_apple_relatedExternalID:(id)a3;
- (void)setX_apple_scheduletag:(id)a3;
- (void)setX_apple_serverFilename:(id)a3;
- (void)setX_apple_structured_location:(id)a3;
- (void)setX_apple_suggestionInfoChangedFields:(unint64_t)a3;
- (void)setX_apple_suggestionInfoChangesAcknowledged:(BOOL)a3;
- (void)setX_apple_suggestionInfoOpaqueKey:(id)a3;
- (void)setX_apple_suggestionInfoTimestamp:(id)a3;
- (void)setX_apple_suggestionInfoUniqueKey:(id)a3;
- (void)setX_apple_travel_advisory_behavior:(id)a3;
- (void)setX_apple_travel_duration:(id)a3;
- (void)setX_apple_travel_start:(id)a3;
- (void)setX_apple_universalID:(id)a3;
- (void)setX_calendarserver_access:(int)a3;
@end

@implementation ICSComponent

- (void)setUnrecognizedComponentName:(id)a3
{
  v5 = (NSString *)a3;
  unrecognizedComponentName = self->_unrecognizedComponentName;
  p_unrecognizedComponentName = &self->_unrecognizedComponentName;
  if (unrecognizedComponentName != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_unrecognizedComponentName, a3);
    v5 = v8;
  }
}

- (NSString)unrecognizedComponentName
{
  return self->_unrecognizedComponentName;
}

+ (unint64_t)relationshipTypeFromString:(id)a3
{
  return [a3 isEqualToString:@"X-CALENDARSERVER-RECURRENCE-SET"];
}

+ (id)stringFromRelationshipType:(unint64_t)a3
{
  if (a3 == 1)
  {
    v4 = @"X-CALENDARSERVER-RECURRENCE-SET";
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)stringFromStatus:(int)a3
{
  if ((a3 - 1) > 7)
  {
    v4 = 0;
  }
  else
  {
    v4 = *off_1E6C25060[a3 - 1];
  }
  return v4;
}

+ (int)statusFromString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"TENTATIVE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"CONFIRMED"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"COMPLETED"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"NEEDS-ACTION"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"CANCELLED"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"IN-PROCESS"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"DRAFT"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"FINAL"])
  {
    int v4 = 7;
  }
  else
  {
    [v3 length];
    int v4 = 0;
  }

  return v4;
}

+ (id)makeUID
{
  CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFUUIDRef v3 = CFUUIDCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80]);
  int v4 = (__CFString *)CFUUIDCreateString(v2, v3);
  CFRelease(v3);
  return v4;
}

+ (id)name
{
  return 0;
}

- (ICSComponent)init
{
  v8.receiver = self;
  v8.super_class = (Class)ICSComponent;
  CFAllocatorRef v2 = [(ICSComponent *)&v8 init];
  if (v2)
  {
    CFUUIDRef v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    properties = v2->_properties;
    v2->_properties = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    components = v2->_components;
    v2->_components = v5;
  }
  return v2;
}

- (id)debugDescription
{
  v4.receiver = self;
  v4.super_class = (Class)ICSComponent;
  CFAllocatorRef v2 = [(ICSComponent *)&v4 description];
  return v2;
}

- (BOOL)validate:(id *)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  objc_super v4 = self->_components;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if (!objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "validate:", a3, (void)v11))
        {
          BOOL v9 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 1;
LABEL_11:

  return v9;
}

- (void)removePropertiesForName:(id)a3
{
}

- (id)propertiesForName:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_properties objectForKey:a3];
}

- (void)setProperties:(id)a3 forName:(id)a4
{
  properties = self->_properties;
  if (a3) {
    [(NSMutableDictionary *)properties setObject:a3 forKey:a4];
  }
  else {
    [(NSMutableDictionary *)properties removeObjectForKey:a4];
  }
}

- (void)setProperty:(id)a3 forName:(id)a4
{
  id v9 = a3;
  if (v9)
  {
    uint64_t v6 = (objc_class *)MEMORY[0x1E4F1CA48];
    id v7 = a4;
    id v8 = (id)objc_msgSend([v6 alloc], "initWithObjects:", v9, 0);
    [(ICSComponent *)self setProperties:v8 forName:v7];
  }
  else
  {
    id v8 = a4;
    [(ICSComponent *)self removePropertiesForName:v8];
  }
}

- (void)ICSStringWithOptions:(unint64_t)a3 appendingToString:(id)a4
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  unint64_t v7 = a3 & 8;
  v51 = [(ICSComponent *)self propertiesToExcludeForChecksum];
  uint64_t v8 = [(id)objc_opt_class() name];
  if (!v8)
  {
    uint64_t v8 = [(ICSComponent *)self unrecognizedComponentName];
  }
  [v6 appendString:@"BEGIN:"];
  v50 = (void *)v8;
  [v6 appendString:v8];
  [v6 appendString:@"\r\n"];
  id v9 = [(NSMutableDictionary *)self->_properties allKeys];
  v10 = v9;
  __int16 v57 = a3;
  unint64_t v11 = a3 | (v7 >> 1);
  if ((v11 & 4) != 0)
  {
    long long v12 = [v9 sortedArrayUsingSelector:sel_compare_];

    v61 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v12, "count"));
    v10 = v12;
  }
  else
  {
    v61 = 0;
  }
  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  id obj = v10;
  uint64_t v13 = [obj countByEnumeratingWithState:&v74 objects:v80 count:16];
  unint64_t v60 = v11;
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v75;
    unint64_t v53 = v7;
    v54 = self;
    uint64_t v52 = *(void *)v75;
    do
    {
      uint64_t v16 = 0;
      uint64_t v55 = v14;
      do
      {
        if (*(void *)v75 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void *)(*((void *)&v74 + 1) + 8 * v16);
        if (![(ICSComponent *)self ignorePropertyWithName:v17]
          && (!v7 || ([v51 containsObject:v17] & 1) == 0))
        {
          uint64_t v58 = v16;
          v59 = [(NSMutableDictionary *)self->_properties objectForKey:v17];
          char v18 = v57;
          if ((v57 & 0x200) == 0
            || ([(ICSComponent *)self propertiesToHide],
                v19 = objc_claimAutoreleasedReturnValue(),
                char v20 = [v19 containsObject:v17],
                v19,
                char v18 = v57,
                (v20 & 1) == 0))
          {
            uint64_t v65 = v17;
            if ((v18 & 0x10) != 0)
            {
              v21 = [(ICSComponent *)self propertiesToObscure];
              int v64 = [v21 containsObject:v17];
            }
            else
            {
              int v64 = 0;
            }
            long long v72 = 0u;
            long long v73 = 0u;
            long long v70 = 0u;
            long long v71 = 0u;
            id v62 = v59;
            uint64_t v22 = [v62 countByEnumeratingWithState:&v70 objects:v79 count:16];
            if (v22)
            {
              uint64_t v23 = v22;
              uint64_t v63 = *(void *)v71;
              do
              {
                uint64_t v24 = 0;
                do
                {
                  if (*(void *)v71 != v63) {
                    objc_enumerationMutation(v62);
                  }
                  v25 = *(void **)(*((void *)&v70 + 1) + 8 * v24);
                  id v26 = objc_alloc_init(MEMORY[0x1E4F28E78]);
                  [v26 appendString:v65];
                  if (v64)
                  {
                    v27 = objc_alloc_init(ICSStringWriter);
                    [v25 ICSStringWithOptions:v11 appendingToString:v27];
                    v28 = [(ICSStringWriter *)v27 result];
                    if ([v28 hasPrefix:@":"])
                    {
                      v29 = [v28 substringFromIndex:1];
                      id v30 = v6;
                      v31 = NSString;
                      v32 = ICSRedactString(v29);
                      v33 = [v31 stringWithFormat:@":%@", v32];
                      [v26 appendString:v33];

                      id v6 = v30;
                      unint64_t v11 = v60;
                    }
                    else
                    {
                      v29 = ICSRedactString(v28);
                      [v26 appendString:v29];
                    }
                  }
                  else
                  {
                    v27 = [[ICSStringWriter alloc] initWithString:v26];
                    [v25 ICSStringWithOptions:v11 appendingToString:v27];
                    [(ICSStringWriter *)v27 mutableResult];
                    v28 = v26;
                    id v26 = (id)objc_claimAutoreleasedReturnValue();
                  }

                  if ((v57 & 0x48) == 0)
                  {
                    if ([v26 length])
                    {
                      unint64_t v34 = [v26 length] - 1;
                      if (v34 >= 0x48)
                      {
                        unint64_t v35 = 0;
                        unint64_t v36 = v34 / 0x48;
                        unint64_t v37 = 72 * (v34 / 0x48);
                        do
                        {
                          BOOL v38 = ([v26 characterAtIndex:v37] & 0xFC00) == 56320;
                          unint64_t v39 = v37 - v38;
                          if (v37 - v38 != v35)
                          {
                            [v26 insertString:@"\r\n " atIndex:v37 - v38];
                            unint64_t v35 = v39;
                          }
                          v37 -= 72;
                          --v36;
                        }
                        while (v36);
                      }
                    }
                  }
                  [v26 appendString:@"\r\n"];
                  if ((v11 & 4) != 0) {
                    [v61 addObject:v26];
                  }
                  else {
                    [v6 appendString:v26];
                  }

                  ++v24;
                }
                while (v24 != v23);
                uint64_t v40 = [v62 countByEnumeratingWithState:&v70 objects:v79 count:16];
                uint64_t v23 = v40;
              }
              while (v40);
            }

            unint64_t v7 = v53;
            self = v54;
            uint64_t v14 = v55;
            uint64_t v15 = v52;
          }

          uint64_t v16 = v58;
        }
        ++v16;
      }
      while (v16 != v14);
      uint64_t v14 = [obj countByEnumeratingWithState:&v74 objects:v80 count:16];
    }
    while (v14);
  }

  if ((v11 & 4) != 0)
  {
    v41 = [v61 sortedArrayUsingSelector:sel_compare_];
    v42 = [v41 componentsJoinedByString:&stru_1F3601330];
    [v6 appendString:v42];
  }
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  v43 = self->_components;
  uint64_t v44 = [(NSMutableArray *)v43 countByEnumeratingWithState:&v66 objects:v78 count:16];
  if (v44)
  {
    uint64_t v45 = v44;
    uint64_t v46 = *(void *)v67;
    do
    {
      for (uint64_t i = 0; i != v45; ++i)
      {
        if (*(void *)v67 != v46) {
          objc_enumerationMutation(v43);
        }
        v48 = *(void **)(*((void *)&v66 + 1) + 8 * i);
        v49 = (void *)MEMORY[0x1E01964E0]();
        [v48 ICSStringWithOptions:v60 appendingToString:v6];
      }
      uint64_t v45 = [(NSMutableArray *)v43 countByEnumeratingWithState:&v66 objects:v78 count:16];
    }
    while (v45);
  }

  [v6 appendString:@"END:"];
  [v6 appendString:v50];
  [v6 appendString:@"\r\n"];
}

- (BOOL)ignorePropertyWithName:(id)a3
{
  id v4 = a3;
  if ((([v4 isEqualToString:@"X-MICROSOFT-CDO-ALLDAYEVENT"] & 1) != 0
     || [v4 isEqualToString:@"X-FUNAMBOL-ALLDAY"])
    && ![(ICSComponent *)self isAllDay])
  {
    char v5 = 1;
  }
  else
  {
    char v5 = [v4 isEqualToString:@"iCalendar-ForcedAllDay"];
  }

  return v5;
}

- (id)ICSStringWithOptions:(unint64_t)a3
{
  char v5 = objc_alloc_init(ICSStringWriter);
  [(ICSComponent *)self ICSStringWithOptions:a3 appendingToString:v5];
  id v6 = [(ICSStringWriter *)v5 result];

  return v6;
}

- (NSSet)propertiesToExcludeForChecksum
{
  if (propertiesToExcludeForChecksum_onceToken != -1) {
    dispatch_once(&propertiesToExcludeForChecksum_onceToken, &__block_literal_global);
  }
  CFAllocatorRef v2 = (void *)propertiesToExcludeForChecksum_propertiesToExclude;
  return (NSSet *)v2;
}

void __46__ICSComponent_propertiesToExcludeForChecksum__block_invoke()
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = @"DTSTAMP";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  uint64_t v2 = [v0 setWithArray:v1];
  CFUUIDRef v3 = (void *)propertiesToExcludeForChecksum_propertiesToExclude;
  propertiesToExcludeForChecksum_propertiesToExclude = v2;
}

- (id)propertiesToObscure
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"SUMMARY", @"DESCRIPTION", @"URL", @"COMMENT", @"X-CALENDARSERVER-PRIVATE-COMMENT", @"LOCATION", 0);
}

- (id)propertiesToHide
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"X-CALENDARSERVER-PRIVATE-COMMENT", @"X-CALENDARSERVER-ATTENDEE-COMMENT", 0);
}

- (BOOL)shouldObscureParameter:(id)a3
{
  return 0;
}

- (BOOL)shouldObscureValue
{
  return 0;
}

- (NSMutableArray)components
{
  return self->_components;
}

- (void)setComponents:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unrecognizedComponentName, 0);
  objc_storeStrong((id *)&self->_components, 0);
  objc_storeStrong((id *)&self->_properties, 0);
}

- (void)addComponent:(id)a3 withUIDGenerator:(id)a4
{
  if (a3)
  {
    id v5 = a3;
    id v6 = [(ICSComponent *)self components];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      id v8 = objc_alloc(MEMORY[0x1E4F1CA48]);
      id v9 = [(ICSComponent *)self components];
      v10 = (void *)[v8 initWithArray:v9];

      [(ICSComponent *)self setComponents:v10];
    }
    id v11 = [(ICSComponent *)self components];
    [v11 addObject:v5];
  }
}

- (void)removeComponent:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(ICSComponent *)self components];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      id v7 = objc_alloc(MEMORY[0x1E4F1CA48]);
      id v8 = [(ICSComponent *)self components];
      id v9 = (void *)[v7 initWithArray:v8];

      [(ICSComponent *)self setComponents:v9];
    }
    id v10 = [(ICSComponent *)self components];
    [v10 removeObject:v4];
  }
}

- (void)addProperty:(id)a3 withValue:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if (v10 && v6)
  {
    id v7 = [(NSMutableDictionary *)self->_properties objectForKey:v10];
    id v8 = v7;
    if (v7)
    {
      if (([v7 containsObject:v6] & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v9 = [MEMORY[0x1E4F1CA48] arrayWithArray:v8];

          [(ICSComponent *)self setProperties:v9 forName:v10];
          id v8 = (void *)v9;
        }
        [v8 addObject:v6];
      }
    }
    else
    {
      [(ICSComponent *)self setProperty:v6 forName:v10];
    }
  }
}

- (id)properties
{
  return self->_properties;
}

- (id)allProperties
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1C9E8];
  CFUUIDRef v3 = [(ICSComponent *)self properties];
  id v4 = [v2 dictionaryWithDictionary:v3];

  return v4;
}

- (NSArray)attach
{
  return (NSArray *)[(ICSComponent *)self propertiesForName:@"ATTACH"];
}

- (void)setAttach:(id)a3
{
}

- (NSArray)attendee
{
  return (NSArray *)[(ICSComponent *)self propertiesForName:@"ATTENDEE"];
}

- (void)setAttendee:(id)a3
{
}

- (int)classification
{
  uint64_t v2 = [(ICSComponent *)self propertiesForName:@"CLASS"];
  CFUUIDRef v3 = [v2 lastObject];
  id v4 = [v3 value];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v5 = [v4 longValue];
  }
  else {
    int v5 = 0;
  }

  return v5;
}

- (void)setClassification:(int)a3
{
  if (a3)
  {
    id v4 = +[ICSPredefinedValue numberWithLong:a3];
    [(ICSComponent *)self setPropertyValue:v4 type:5005 forName:@"CLASS"];
  }
  else
  {
    [(ICSComponent *)self removePropertiesForName:@"CLASS"];
  }
}

- (ICSDate)created
{
  uint64_t v2 = [(ICSComponent *)self propertiesForName:@"CREATED"];
  CFUUIDRef v3 = [v2 lastObject];

  return (ICSDate *)v3;
}

- (void)setCreated:(id)a3
{
}

- (NSString)description
{
  uint64_t v2 = [(ICSComponent *)self propertiesForName:@"DESCRIPTION"];
  CFUUIDRef v3 = [v2 lastObject];
  id v4 = [v3 value];

  return (NSString *)v4;
}

- (void)setDescription:(id)a3
{
}

- (void)setPropertyValue:(id)a3 forName:(id)a4
{
  id v8 = a3;
  if (v8)
  {
    id v6 = a4;
    id v7 = [[ICSProperty alloc] initWithValue:v8 type:5007];
    [(ICSComponent *)self setProperty:v7 forName:v6];
  }
  else
  {
    id v7 = (ICSProperty *)a4;
    [(ICSComponent *)self removePropertiesForName:v7];
  }
}

- (void)setPropertyValue:(id)a3 type:(int)a4 forName:(id)a5
{
  id v10 = a3;
  if (v10)
  {
    id v8 = a5;
    uint64_t v9 = [[ICSProperty alloc] initWithValue:v10 type:a4];
    [(ICSComponent *)self setProperty:v9 forName:v8];
  }
  else
  {
    uint64_t v9 = (ICSProperty *)a5;
    [(ICSComponent *)self removePropertiesForName:v9];
  }
}

- (ICSDate)dtstamp
{
  uint64_t v2 = [(ICSComponent *)self propertiesForName:@"DTSTAMP"];
  CFUUIDRef v3 = [v2 lastObject];

  return (ICSDate *)v3;
}

- (void)setDtstamp:(id)a3
{
}

- (ICSDate)dtstart
{
  uint64_t v2 = [(ICSComponent *)self propertiesForName:@"DTSTART"];
  CFUUIDRef v3 = [v2 lastObject];

  return (ICSDate *)v3;
}

- (void)setDtstart:(id)a3
{
}

- (BOOL)isAllDay
{
  if ([(ICSComponent *)self forcedAllDay])
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    id v4 = [(ICSComponent *)self dtstart];
    int v3 = [v4 hasTimeComponent] ^ 1;
  }
  return v3;
}

- (ICSDate)dtend
{
  uint64_t v2 = [(ICSComponent *)self propertiesForName:@"DTEND"];
  int v3 = [v2 lastObject];

  return (ICSDate *)v3;
}

- (void)setDtend:(id)a3
{
  [(ICSComponent *)self setProperty:a3 forName:@"DTEND"];
  if (a3)
  {
    [(ICSComponent *)self removePropertiesForName:@"DURATION"];
  }
}

- (ICSDuration)duration
{
  uint64_t v2 = [(ICSComponent *)self propertiesForName:@"DURATION"];
  int v3 = [v2 lastObject];
  id v4 = [v3 value];

  return (ICSDuration *)v4;
}

- (void)setDuration:(id)a3
{
  id v4 = a3;
  if (v4) {
    [(ICSComponent *)self removePropertiesForName:@"DTEND"];
  }
  [(ICSComponent *)self setPropertyValue:v4 type:5011 forName:@"DURATION"];
}

- (void)setExdate:(id)a3
{
}

- (NSArray)exdate
{
  return (NSArray *)[(ICSComponent *)self propertiesForName:@"EXDATE"];
}

- (void)setExrule:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [MEMORY[0x1E4F1CA48] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * v10);
        long long v12 = [ICSProperty alloc];
        uint64_t v13 = -[ICSProperty initWithValue:type:](v12, "initWithValue:type:", v11, 5029, (void)v14);
        [v5 addObject:v13];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  [(ICSComponent *)self setProperties:v5 forName:@"EXRULE"];
}

- (NSArray)exrule
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(ICSComponent *)self propertiesForName:@"EXRULE"];
  if (v2)
  {
    int v3 = [MEMORY[0x1E4F1CA48] array];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v4 = v2;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "value", (void)v11);
          [v3 addObject:v9];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v6);
    }
  }
  else
  {
    int v3 = 0;
  }

  return (NSArray *)v3;
}

- (ICSDate)last_modified
{
  uint64_t v2 = [(ICSComponent *)self propertiesForName:@"LAST-MODIFIED"];
  int v3 = [v2 lastObject];

  return (ICSDate *)v3;
}

- (void)setLast_modified:(id)a3
{
}

- (NSString)location
{
  uint64_t v2 = [(ICSComponent *)self propertiesForName:@"LOCATION"];
  int v3 = [v2 lastObject];
  id v4 = [v3 value];

  return (NSString *)v4;
}

- (void)setLocation:(id)a3
{
}

- (ICSUserAddress)organizer
{
  uint64_t v2 = [(ICSComponent *)self propertiesForName:@"ORGANIZER"];
  int v3 = [v2 lastObject];

  return (ICSUserAddress *)v3;
}

- (void)setOrganizer:(id)a3
{
}

- (void)setRdate:(id)a3
{
}

- (NSArray)rdate
{
  return (NSArray *)[(ICSComponent *)self propertiesForName:@"RDATE"];
}

- (ICSDate)recurrence_id
{
  uint64_t v2 = [(ICSComponent *)self propertiesForName:@"RECURRENCE-ID"];
  int v3 = [v2 lastObject];

  return (ICSDate *)v3;
}

- (void)setRecurrence_id:(id)a3
{
}

- (void)setRrule:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * v10);
        long long v12 = [ICSProperty alloc];
        long long v13 = -[ICSProperty initWithValue:type:](v12, "initWithValue:type:", v11, 5029, (void)v14);
        [v5 addObject:v13];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  [(ICSComponent *)self setProperties:v5 forName:@"RRULE"];
}

- (NSArray)rrule
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(ICSComponent *)self propertiesForName:@"RRULE"];
  if (v2)
  {
    int v3 = [MEMORY[0x1E4F1CA48] array];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v4 = v2;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "value", (void)v11);
          [v3 addObject:v9];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v6);
    }
  }
  else
  {
    int v3 = 0;
  }

  return (NSArray *)v3;
}

- (void)setSequence:(unint64_t)a3
{
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  [(ICSComponent *)self setPropertyValue:v4 type:5008 forName:@"SEQUENCE"];
}

- (unint64_t)sequence
{
  int v3 = [(ICSComponent *)self propertiesForName:@"SEQUENCE"];

  if (!v3) {
    return 0;
  }
  id v4 = [(ICSComponent *)self propertiesForName:@"SEQUENCE"];
  uint64_t v5 = [v4 lastObject];
  uint64_t v6 = [v5 value];
  unint64_t v7 = [v6 unsignedIntegerValue];

  return v7;
}

- (int)status
{
  uint64_t v2 = [(ICSComponent *)self propertiesForName:@"STATUS"];
  int v3 = [v2 lastObject];
  id v4 = [v3 value];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v5 = [v4 longValue];
  }
  else {
    int v5 = 0;
  }

  return v5;
}

- (void)setStatus:(int)a3
{
  if (a3)
  {
    id v4 = +[ICSPredefinedValue numberWithLong:a3];
    [(ICSComponent *)self setPropertyValue:v4 type:5003 forName:@"STATUS"];
  }
  else
  {
    [(ICSComponent *)self removePropertiesForName:@"STATUS"];
  }
}

- (NSString)statusString
{
  uint64_t v2 = [(ICSComponent *)self propertiesForName:@"STATUS"];
  int v3 = [v2 lastObject];
  id v4 = [v3 value];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v5 = [v4 statusString];
  }
  else
  {
    int v5 = 0;
  }

  return (NSString *)v5;
}

- (void)setStatusString:(id)a3
{
  id v5 = a3;
  if ([v5 length])
  {
    id v4 = +[ICSStatusValue statusValueFromICSString:v5];
    [(ICSComponent *)self setPropertyValue:v4 type:5003 forName:@"STATUS"];
  }
  else
  {
    [(ICSComponent *)self removePropertiesForName:@"STATUS"];
  }
}

- (NSArray)relatedTo
{
  return (NSArray *)[(ICSComponent *)self propertiesForName:@"RELATED-TO"];
}

- (void)setRelatedTo:(id)a3
{
}

- (NSString)summary
{
  uint64_t v2 = [(ICSComponent *)self propertiesForName:@"SUMMARY"];
  int v3 = [v2 lastObject];
  id v4 = [v3 value];

  return (NSString *)v4;
}

- (void)setSummary:(id)a3
{
}

- (ICSTrigger)trigger
{
  uint64_t v2 = [(ICSComponent *)self propertiesForName:@"TRIGGER"];
  int v3 = [v2 lastObject];

  return (ICSTrigger *)v3;
}

- (void)setTrigger:(id)a3
{
}

- (NSString)uid
{
  uint64_t v2 = [(ICSComponent *)self propertiesForName:@"UID"];
  int v3 = [v2 lastObject];
  id v4 = [v3 value];

  return (NSString *)v4;
}

- (void)setUid:(id)a3
{
}

- (NSURL)url
{
  uint64_t v2 = [(ICSComponent *)self propertiesForName:@"URL"];
  int v3 = [v2 lastObject];
  id v4 = [v3 value];

  return (NSURL *)v4;
}

- (void)setUrl:(id)a3
{
}

- (unint64_t)priority
{
  int v3 = [(ICSComponent *)self propertiesForName:@"PRIORITY"];

  if (!v3) {
    return 0;
  }
  id v4 = [(ICSComponent *)self propertiesForName:@"PRIORITY"];
  id v5 = [v4 lastObject];
  uint64_t v6 = [v5 value];
  unint64_t v7 = [v6 unsignedIntegerValue];

  return v7;
}

- (void)setPriority:(unint64_t)a3
{
  if (a3)
  {
    uint64_t v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  }
  else
  {
    uint64_t v4 = 0;
  }
  id v5 = (id)v4;
  [(ICSComponent *)self setPropertyValue:v4 type:5008 forName:@"PRIORITY"];
}

- (int)x_calendarserver_access
{
  uint64_t v2 = [(ICSComponent *)self propertiesForName:@"X-CALENDARSERVER-ACCESS"];
  int v3 = [v2 lastObject];
  uint64_t v4 = [v3 value];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v5 = [v4 longValue];
  }
  else {
    int v5 = 0;
  }

  return v5;
}

- (void)setX_calendarserver_access:(int)a3
{
  if (a3)
  {
    id v4 = +[ICSPredefinedValue numberWithLong:a3];
    [(ICSComponent *)self setPropertyValue:v4 type:5030 forName:@"X-CALENDARSERVER-ACCESS"];
  }
  else
  {
    [(ICSComponent *)self removePropertiesForName:@"X-CALENDARSERVER-ACCESS"];
  }
}

- (NSString)x_apple_dropbox
{
  uint64_t v2 = [(ICSComponent *)self propertiesForName:@"X-APPLE-DROPBOX"];
  int v3 = [v2 lastObject];
  id v4 = [v3 value];

  return (NSString *)v4;
}

- (void)setX_apple_dropbox:(id)a3
{
}

- (NSString)x_apple_ews_changekey
{
  uint64_t v2 = [(ICSComponent *)self propertiesForName:@"X-APPLE-EWS-CHANGEKEY"];
  int v3 = [v2 lastObject];
  id v4 = [v3 value];

  return (NSString *)v4;
}

- (void)setX_apple_ews_changekey:(id)a3
{
}

- (NSString)x_apple_ews_itemid
{
  uint64_t v2 = [(ICSComponent *)self propertiesForName:@"X-APPLE-EWS-ITEMID"];
  int v3 = [v2 lastObject];
  id v4 = [v3 value];

  return (NSString *)v4;
}

- (void)setX_apple_ews_itemid:(id)a3
{
}

- (NSString)x_apple_ews_permission
{
  uint64_t v2 = [(ICSComponent *)self propertiesForName:@"X-APPLE-EWS-PERMISSION"];
  int v3 = [v2 lastObject];
  id v4 = [v3 value];

  return (NSString *)v4;
}

- (void)setX_apple_ews_permission:(id)a3
{
}

- (BOOL)x_apple_ews_needsserverconfirmation
{
  uint64_t v2 = [(ICSComponent *)self propertiesForName:@"X-APPLE-EWS-NEEDSSERVERCONFIRMATION"];
  int v3 = [v2 lastObject];
  id v4 = [v3 value];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (void)setX_apple_ews_needsserverconfirmation:(BOOL)a3
{
  if (a3)
  {
    uint64_t v4 = [NSNumber numberWithBool:1];
  }
  else
  {
    uint64_t v4 = 0;
  }
  id v5 = (id)v4;
  [(ICSComponent *)self setPropertyValue:v4 type:5012 forName:@"X-APPLE-EWS-NEEDSSERVERCONFIRMATION"];
}

- (void)setX_apple_ignore_on_restore:(BOOL)a3
{
  if (a3)
  {
    id v4 = [NSNumber numberWithBool:1];
    [(ICSComponent *)self setPropertyValue:v4 type:5012 forName:@"X-APPLE-IGNORE-ON-RESTORE"];
  }
  else
  {
    [(ICSComponent *)self removePropertiesForName:@"X-APPLE-IGNORE-ON-RESTORE"];
  }
}

- (BOOL)x_apple_ignore_on_restore
{
  uint64_t v2 = [(ICSComponent *)self propertiesForName:@"X-APPLE-IGNORE-ON-RESTORE"];
  int v3 = [v2 lastObject];
  id v4 = [v3 value];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (void)setX_apple_structured_location:(id)a3
{
}

- (ICSStructuredLocation)x_apple_structured_location
{
  uint64_t v2 = [(ICSComponent *)self propertiesForName:@"X-APPLE-STRUCTURED-LOCATION"];
  int v3 = [v2 lastObject];

  return (ICSStructuredLocation *)v3;
}

- (void)setX_apple_etag:(id)a3
{
}

- (NSString)x_apple_etag
{
  uint64_t v2 = [(ICSComponent *)self propertiesForName:@"X-APPLE-ETAG"];
  int v3 = [v2 lastObject];
  id v4 = [v3 value];

  return (NSString *)v4;
}

- (void)setX_apple_scheduletag:(id)a3
{
}

- (NSString)x_apple_scheduletag
{
  uint64_t v2 = [(ICSComponent *)self propertiesForName:@"X-APPLE-SCHEDULETAG"];
  int v3 = [v2 lastObject];
  id v4 = [v3 value];

  return (NSString *)v4;
}

- (void)setX_apple_serverFilename:(id)a3
{
}

- (NSString)x_apple_serverFilename
{
  uint64_t v2 = [(ICSComponent *)self propertiesForName:@"X-APPLE-SERVERFILENAME"];
  int v3 = [v2 lastObject];
  id v4 = [v3 value];

  return (NSString *)v4;
}

- (void)setConferences:(id)a3
{
}

- (NSArray)conferences
{
  return (NSArray *)[(ICSComponent *)self propertiesForName:@"CONFERENCE"];
}

- (id)x_apple_travel_duration
{
  uint64_t v2 = [(ICSComponent *)self propertiesForName:@"X-APPLE-TRAVEL-DURATION"];
  int v3 = [v2 lastObject];

  return v3;
}

- (void)setX_apple_travel_duration:(id)a3
{
}

- (id)x_apple_travel_advisory_behavior
{
  uint64_t v2 = [(ICSComponent *)self propertiesForName:@"X-APPLE-TRAVEL-ADVISORY-BEHAVIOR"];
  int v3 = [v2 lastObject];

  return v3;
}

- (void)setX_apple_travel_advisory_behavior:(id)a3
{
}

- (void)setX_apple_travel_start:(id)a3
{
}

- (id)x_apple_travel_start
{
  uint64_t v2 = [(ICSComponent *)self propertiesForName:@"X-APPLE-TRAVEL-START"];
  int v3 = [v2 lastObject];

  return v3;
}

- (void)setX_apple_end_location:(id)a3
{
}

- (id)x_apple_end_location
{
  uint64_t v2 = [(ICSComponent *)self propertiesForName:@"X-APPLE-END-LOCATION"];
  int v3 = [v2 lastObject];

  return v3;
}

- (BOOL)forcedAllDay
{
  uint64_t v2 = [(ICSComponent *)self propertiesForName:@"iCalendar-ForcedAllDay"];
  int v3 = [v2 lastObject];
  id v4 = [v3 value];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (void)setForcedAllDay:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(ICSComponent *)self setPropertyValue:v4 type:5012 forName:@"iCalendar-ForcedAllDay"];
}

- (BOOL)x_apple_suggestionInfoChangesAcknowledged
{
  uint64_t v2 = [(ICSComponent *)self propertiesForName:@"X-APPLE-SUGGESTION-INFO-CHANGES-ACKNOWLEDGED"];
  int v3 = [v2 lastObject];
  id v4 = [v3 value];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (void)setX_apple_suggestionInfoChangesAcknowledged:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(ICSComponent *)self setPropertyValue:v4 type:5012 forName:@"X-APPLE-SUGGESTION-INFO-CHANGES-ACKNOWLEDGED"];
}

- (unint64_t)x_apple_suggestionInfoChangedFields
{
  uint64_t v2 = [(ICSComponent *)self propertiesForName:@"X-APPLE-SUGGESTION-INFO-CHANGED-FIELDS"];
  int v3 = [v2 lastObject];
  id v4 = [v3 value];
  unint64_t v5 = [v4 unsignedIntegerValue];

  return v5;
}

- (void)setX_apple_suggestionInfoChangedFields:(unint64_t)a3
{
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  [(ICSComponent *)self setPropertyValue:v4 type:5008 forName:@"X-APPLE-SUGGESTION-INFO-CHANGED-FIELDS"];
}

- (NSString)x_apple_suggestionInfoOpaqueKey
{
  uint64_t v2 = [(ICSComponent *)self propertiesForName:@"X-APPLE-SUGGESTION-INFO-OPAQUE-KEY"];
  int v3 = [v2 lastObject];
  id v4 = [v3 value];

  return (NSString *)v4;
}

- (void)setX_apple_suggestionInfoOpaqueKey:(id)a3
{
}

- (ICSDate)x_apple_suggestionInfoTimestamp
{
  uint64_t v2 = [(ICSComponent *)self propertiesForName:@"X-APPLE-SUGGESTION-INFO-TIMESTAMP"];
  int v3 = [v2 lastObject];

  return (ICSDate *)v3;
}

- (void)setX_apple_suggestionInfoTimestamp:(id)a3
{
}

- (NSString)x_apple_suggestionInfoUniqueKey
{
  uint64_t v2 = [(ICSComponent *)self propertiesForName:@"X-APPLE-SUGGESTION-INFO-UNIQUE-KEY"];
  int v3 = [v2 lastObject];
  id v4 = [v3 value];

  return (NSString *)v4;
}

- (void)setX_apple_suggestionInfoUniqueKey:(id)a3
{
}

- (NSString)x_apple_contactIdentifiers
{
  uint64_t v2 = [(ICSComponent *)self propertiesForName:@"X-APPLE-CONTACT-IDENTIFIERS"];
  int v3 = [v2 lastObject];
  id v4 = [v3 value];

  return (NSString *)v4;
}

- (void)setX_apple_contactIdentifiers:(id)a3
{
}

- (NSString)x_apple_relatedExternalID
{
  uint64_t v2 = [(ICSComponent *)self propertiesForName:@"X-APPLE-EXTERNAL-REFERENCE-ID"];
  int v3 = [v2 lastObject];
  id v4 = [v3 value];

  return (NSString *)v4;
}

- (void)setX_apple_relatedExternalID:(id)a3
{
}

- (NSString)x_apple_universalID
{
  uint64_t v2 = [(ICSComponent *)self propertiesForName:@"X-APPLE-UNIVERSAL-ID"];
  int v3 = [v2 lastObject];
  id v4 = [v3 value];

  return (NSString *)v4;
}

- (void)setX_apple_universalID:(id)a3
{
}

+ (id)inheritanceKeywords
{
  id v2 = a1;
  objc_sync_enter(v2);
  if (!_sInheritanceKeywords)
  {
    uint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"DTEND", @"DTSTART", @"DURATION", @"EXDATE", @"EXRULE", @"RDATE", @"RRULE", 0);
    id v4 = (void *)_sInheritanceKeywords;
    _sInheritanceKeywords = v3;
  }
  objc_sync_exit(v2);

  unint64_t v5 = (void *)_sInheritanceKeywords;
  return v5;
}

- (void)fixPropertiesInheritance:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(ICSComponent *)self propertiesForName:@"RECURRENCE-ID"];

  if (v5)
  {
    uint64_t v6 = +[ICSComponent inheritanceKeywords];
    [v4 properties];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = v19 = 0u;
    unint64_t v7 = [v15 allValues];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * i);
          if (([v6 containsObject:v12] & 1) == 0)
          {
            long long v13 = [v4 propertiesForName:v12];
            long long v14 = [(ICSComponent *)self propertiesForName:v12];
            if (!v14) {
              [(ICSComponent *)self setProperties:v13 forName:v12];
            }
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v9);
    }
  }
}

- (void)fixAlarms
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA80] setWithCapacity:5];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v29 = self;
  id v4 = [(ICSComponent *)self components];
  unint64_t v5 = (void *)[v4 copy];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v31;
    unint64_t v9 = 0x1E6C24000uLL;
    v28 = v3;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v31 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v11 = *(void **)(*((void *)&v30 + 1) + 8 * v10);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v12 = v11;
          long long v13 = objc_msgSend(v12, "x_wr_alarmuid");
          if ([v3 containsObject:v13]) {
            goto LABEL_8;
          }
          if ([v12 action] == 3)
          {
            long long v15 = [v12 attendee];
            uint64_t v16 = [v15 count];

            if (!v16)
            {
LABEL_8:
              long long v14 = [(ICSComponent *)v29 components];
              [v14 removeObject:v12];

LABEL_24:
              goto LABEL_25;
            }
          }
          else if ([v12 action] == 4)
          {
            long long v17 = [v12 attach];
            if (v17)
            {
            }
            else
            {
              long long v18 = [v12 bookmark];

              if (!v18) {
                goto LABEL_8;
              }
            }
          }
          long long v19 = v5;
          unint64_t v20 = v9;
          uint64_t v21 = objc_msgSend(v12, "trigger", v28);
          int v22 = [v21 isDurationBased];

          uint64_t v23 = [v12 trigger];
          uint64_t v24 = v23;
          if (v22)
          {
            v25 = [v23 value];
LABEL_20:
            objc_opt_class();
            char isKindOfClass = objc_opt_isKindOfClass();

            if ((isKindOfClass & 1) == 0)
            {
              v27 = [(ICSComponent *)v29 components];
              [v27 removeObject:v12];

              unint64_t v9 = v20;
              unint64_t v5 = v19;
              uint64_t v3 = v28;
              goto LABEL_24;
            }
          }
          else
          {

            if (v24)
            {
              uint64_t v24 = [v12 trigger];
              v25 = [v24 value];
              goto LABEL_20;
            }
          }
          [v12 fixAlarm];
          unint64_t v9 = v20;
          unint64_t v5 = v19;
          uint64_t v3 = v28;
          if ([v13 length]) {
            [v28 addObject:v13];
          }
          goto LABEL_24;
        }
LABEL_25:
        ++v10;
      }
      while (v7 != v10);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v7);
  }
}

- (void)fixRelatedTo
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(ICSComponent *)self propertiesForName:@"RELATED-TO"];

  if (v3)
  {
    id v4 = [(ICSComponent *)self relatedTo];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      uint64_t v6 = [(ICSComponent *)self relatedTo];
      uint64_t v7 = (void *)[v6 copy];

      uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v17;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v17 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              long long v13 = [(ICSComponent *)self relatedTo];
              [v13 removeObject:v12];
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
        }
        while (v9);
      }

      long long v14 = [(ICSComponent *)self relatedTo];
      uint64_t v15 = [v14 count];

      if (!v15) {
        [(ICSComponent *)self removePropertiesForName:@"RELATED-TO"];
      }
    }
    else
    {
      [(ICSComponent *)self removePropertiesForName:@"RELATED-TO"];
    }
  }
}

- (void)fixAttendees
{
  uint64_t v3 = [(ICSComponent *)self propertiesForName:@"ATTENDEE"];

  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F1CA80]);
    unint64_t v5 = [(ICSComponent *)self attendee];
    id v14 = (id)objc_msgSend(v4, "initWithCapacity:", objc_msgSend(v5, "count"));

    uint64_t v6 = [(ICSComponent *)self attendee];
    uint64_t v7 = [MEMORY[0x1E4F28E60] indexSet];
    if ([v6 count])
    {
      unint64_t v8 = 0;
      do
      {
        uint64_t v9 = [v6 objectAtIndexedSubscript:v8];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v10 = NSString;
          long long v11 = [v9 cn];
          uint64_t v12 = [v9 value];
          long long v13 = [v10 stringWithFormat:@"%@ <%@>", v11, v12];

          if ([v14 containsObject:v13]) {
            [v7 addIndex:v8];
          }
          else {
            [v14 addObject:v13];
          }
        }
        else
        {
          [v7 addIndex:v8];
        }

        ++v8;
      }
      while (v8 < [v6 count]);
    }
    [v6 removeObjectsAtIndexes:v7];
    if (![v6 count]) {
      [(ICSComponent *)self removePropertiesForName:@"ATTENDEE"];
    }
  }
}

- (void)fixAttachments
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(ICSComponent *)self propertiesForName:@"ATTACH"];

  if (v3)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v4 = [(ICSComponent *)self attach];
    unint64_t v5 = (void *)[v4 copy];

    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * v9);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            long long v11 = [(ICSComponent *)self attach];
            [v11 removeObject:v10];
          }
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }

    uint64_t v12 = [(ICSComponent *)self attach];
    uint64_t v13 = [v12 count];

    if (!v13) {
      [(ICSComponent *)self removePropertiesForName:@"ATTACH"];
    }
  }
}

- (void)fixRecurrenceRules
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(ICSComponent *)self propertiesForName:@"RRULE"];

  if (v3)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v4 = [(ICSComponent *)self propertiesForName:@"RRULE", 0];
    unint64_t v5 = (void *)[v4 copy];

    uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          long long v11 = [v10 value];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) == 0)
          {
            uint64_t v13 = [(ICSComponent *)self rrule];
            [v13 removeObject:v10];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v7);
    }

    long long v14 = [(ICSComponent *)self propertiesForName:@"RRULE"];
    uint64_t v15 = [v14 count];

    if (!v15) {
      [(ICSComponent *)self removePropertiesForName:@"RRULE"];
    }
  }
}

- (void)fixRecurrenceDates
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(ICSComponent *)self propertiesForName:@"RDATE"];

  if (v3)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v4 = [(ICSComponent *)self rdate];
    unint64_t v5 = (void *)[v4 copy];

    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * v9);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            long long v11 = [(ICSComponent *)self propertiesForName:@"RDATE"];
            [v11 removeObject:v10];
          }
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }

    uint64_t v12 = [(ICSComponent *)self propertiesForName:@"RDATE"];
    uint64_t v13 = [v12 count];

    if (!v13) {
      [(ICSComponent *)self removePropertiesForName:@"RDATE"];
    }
  }
}

- (void)fixExceptionRules
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(ICSComponent *)self propertiesForName:@"EXRULE"];

  if (v3)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v4 = [(ICSComponent *)self propertiesForName:@"EXRULE", 0];
    unint64_t v5 = (void *)[v4 copy];

    uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          long long v11 = [v10 value];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) == 0)
          {
            uint64_t v13 = [(ICSComponent *)self exrule];
            [v13 removeObject:v10];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v7);
    }

    long long v14 = [(ICSComponent *)self propertiesForName:@"EXRULE"];
    uint64_t v15 = [v14 count];

    if (!v15) {
      [(ICSComponent *)self removePropertiesForName:@"EXRULE"];
    }
  }
}

- (void)fixExceptionDates
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(ICSComponent *)self propertiesForName:@"EXDATE"];

  if (v3)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v4 = [(ICSComponent *)self exdate];
    unint64_t v5 = (void *)[v4 copy];

    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * v9);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            long long v11 = [(ICSComponent *)self propertiesForName:@"EXDATE"];
            [v11 removeObject:v10];
          }
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }

    uint64_t v12 = [(ICSComponent *)self propertiesForName:@"EXDATE"];
    uint64_t v13 = [v12 count];

    if (!v13) {
      [(ICSComponent *)self removePropertiesForName:@"EXDATE"];
    }
  }
}

- (void)fixSuggestionInfo
{
  uint64_t v3 = [(ICSComponent *)self x_apple_suggestionInfoOpaqueKey];
  if ([v3 length])
  {
    id v4 = [(ICSComponent *)self x_apple_suggestionInfoUniqueKey];
    uint64_t v5 = [v4 length];

    if (v5) {
      goto LABEL_6;
    }
  }
  else
  {
  }
  [(ICSComponent *)self removePropertiesForName:@"X-APPLE-SUGGESTION-INFO-CHANGED-FIELDS"];
  [(ICSComponent *)self removePropertiesForName:@"X-APPLE-SUGGESTION-INFO-CHANGES-ACKNOWLEDGED"];
  [(ICSComponent *)self removePropertiesForName:@"X-APPLE-SUGGESTION-INFO-OPAQUE-KEY"];
  [(ICSComponent *)self removePropertiesForName:@"X-APPLE-SUGGESTION-INFO-TIMESTAMP"];
  [(ICSComponent *)self removePropertiesForName:@"X-APPLE-SUGGESTION-INFO-UNIQUE-KEY"];
LABEL_6:
  uint64_t v6 = [(ICSComponent *)self x_apple_suggestionInfoTimestamp];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    [(ICSComponent *)self removePropertiesForName:@"X-APPLE-SUGGESTION-INFO-TIMESTAMP"];
  }
}

- (void)fixComponent
{
  uint64_t v3 = [(ICSComponent *)self propertiesForName:@"UID"];

  if (v3)
  {
    id v4 = [(ICSComponent *)self uid];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      [(ICSComponent *)self removePropertiesForName:@"UID"];
    }
  }
  uint64_t v6 = [(ICSComponent *)self propertiesForName:@"SUMMARY"];

  if (v6)
  {
    uint64_t v7 = [(ICSComponent *)self summary];
    objc_opt_class();
    char v8 = objc_opt_isKindOfClass();

    if ((v8 & 1) == 0) {
      [(ICSComponent *)self removePropertiesForName:@"SUMMARY"];
    }
  }
  uint64_t v9 = [(ICSComponent *)self propertiesForName:@"DESCRIPTION"];

  if (v9)
  {
    uint64_t v10 = [(ICSComponent *)self description];
    objc_opt_class();
    char v11 = objc_opt_isKindOfClass();

    if ((v11 & 1) == 0) {
      [(ICSComponent *)self removePropertiesForName:@"DESCRIPTION"];
    }
  }
  uint64_t v12 = [(ICSComponent *)self propertiesForName:@"STATUS"];

  if (v12)
  {
    uint64_t v13 = [(ICSComponent *)self propertiesForName:@"STATUS"];
    long long v14 = [v13 lastObject];
    long long v15 = [v14 value];
    objc_opt_class();
    char v16 = objc_opt_isKindOfClass();

    if ((v16 & 1) == 0) {
      [(ICSComponent *)self removePropertiesForName:@"STATUS"];
    }
  }
  long long v17 = [(ICSComponent *)self propertiesForName:@"DTSTART"];

  if (v17)
  {
    long long v18 = [(ICSComponent *)self dtstart];
    objc_opt_class();
    char v19 = objc_opt_isKindOfClass();

    if ((v19 & 1) == 0) {
      [(ICSComponent *)self removePropertiesForName:@"DTSTART"];
    }
  }
  unint64_t v20 = [(ICSComponent *)self propertiesForName:@"URL"];

  if (v20)
  {
    uint64_t v21 = [(ICSComponent *)self url];
    objc_opt_class();
    char v22 = objc_opt_isKindOfClass();

    if ((v22 & 1) == 0) {
      [(ICSComponent *)self removePropertiesForName:@"URL"];
    }
  }
  uint64_t v23 = [(ICSComponent *)self propertiesForName:@"CREATED"];

  if (v23)
  {
    uint64_t v24 = [(ICSComponent *)self created];
    objc_opt_class();
    char v25 = objc_opt_isKindOfClass();

    if ((v25 & 1) == 0) {
      [(ICSComponent *)self removePropertiesForName:@"CREATED"];
    }
  }
  id v26 = [(ICSComponent *)self propertiesForName:@"LAST-MODIFIED"];

  if (v26)
  {
    v27 = [(ICSComponent *)self last_modified];
    objc_opt_class();
    char v28 = objc_opt_isKindOfClass();

    if ((v28 & 1) == 0) {
      [(ICSComponent *)self removePropertiesForName:@"LAST-MODIFIED"];
    }
  }
  v29 = [(ICSComponent *)self propertiesForName:@"DTSTAMP"];

  if (v29)
  {
    long long v30 = [(ICSComponent *)self dtstamp];
    objc_opt_class();
    char v31 = objc_opt_isKindOfClass();

    if ((v31 & 1) == 0) {
      [(ICSComponent *)self removePropertiesForName:@"DTSTAMP"];
    }
  }
  long long v32 = [(ICSComponent *)self propertiesForName:@"SEQUENCE"];

  if (v32)
  {
    long long v33 = [(ICSComponent *)self propertiesForName:@"SEQUENCE"];
    unint64_t v34 = [v33 lastObject];
    uint64_t v35 = [v34 value];
    objc_opt_class();
    char v36 = objc_opt_isKindOfClass();

    if ((v36 & 1) == 0) {
      [(ICSComponent *)self removePropertiesForName:@"SEQUENCE"];
    }
  }
  [(ICSComponent *)self fixAlarms];
  unint64_t v37 = [(ICSComponent *)self organizer];
  objc_opt_class();
  char v38 = objc_opt_isKindOfClass();

  if ((v38 & 1) == 0)
  {
    [(ICSComponent *)self removePropertiesForName:@"ORGANIZER"];
    unint64_t v39 = [(ICSComponent *)self organizer];
    [v39 fixAddress];
  }
  [(ICSComponent *)self fixAttendees];
  [(ICSComponent *)self fixAttachments];
  uint64_t v40 = [(ICSComponent *)self propertiesForName:@"X-WR-ITIPSTATUSATTENDEEML"];

  if (v40)
  {
    v41 = [(ICSComponent *)self propertiesForName:@"X-WR-ITIPSTATUSATTENDEEML"];
    v42 = [v41 lastObject];
    v43 = [v42 value];
    objc_opt_class();
    char v44 = objc_opt_isKindOfClass();

    if ((v44 & 1) == 0) {
      [(ICSComponent *)self removePropertiesForName:@"X-WR-ITIPSTATUSATTENDEEML"];
    }
  }
  uint64_t v45 = [(ICSComponent *)self propertiesForName:@"X-WR-ITIPALREADYSENT"];

  if (v45)
  {
    uint64_t v46 = [(ICSComponent *)self propertiesForName:@"X-WR-ITIPALREADYSENT"];
    v47 = [v46 lastObject];
    v48 = [v47 value];
    objc_opt_class();
    char v49 = objc_opt_isKindOfClass();

    if ((v49 & 1) == 0) {
      [(ICSComponent *)self removePropertiesForName:@"X-WR-ITIPALREADYSENT"];
    }
  }
  v50 = [(ICSComponent *)self propertiesForName:@"X-WR-ITIPSTATUSML"];

  if (v50)
  {
    v51 = [(ICSComponent *)self propertiesForName:@"X-WR-ITIPSTATUSML"];
    uint64_t v52 = [v51 lastObject];
    unint64_t v53 = [v52 value];
    objc_opt_class();
    char v54 = objc_opt_isKindOfClass();

    if ((v54 & 1) == 0) {
      [(ICSComponent *)self removePropertiesForName:@"X-WR-ITIPSTATUSML"];
    }
  }
  uint64_t v55 = [(ICSComponent *)self propertiesForName:@"RECURRENCE-ID"];

  if (v55)
  {
    v56 = [(ICSComponent *)self recurrence_id];
    objc_opt_class();
    char v57 = objc_opt_isKindOfClass();

    if ((v57 & 1) == 0) {
      [(ICSComponent *)self removePropertiesForName:@"RECURRENCE-ID"];
    }
  }
  uint64_t v58 = [(ICSComponent *)self propertiesForName:@"RECURRENCE-ID"];

  if (v58)
  {
    [(ICSComponent *)self removePropertiesForName:@"EXDATE"];
    [(ICSComponent *)self removePropertiesForName:@"EXRULE"];
    [(ICSComponent *)self removePropertiesForName:@"RDATE"];
    [(ICSComponent *)self removePropertiesForName:@"RRULE"];
  }
  [(ICSComponent *)self fixRelatedTo];
  [(ICSComponent *)self fixRecurrenceRules];
  [(ICSComponent *)self fixRecurrenceDates];
  [(ICSComponent *)self fixExceptionRules];
  [(ICSComponent *)self fixExceptionDates];
  [(ICSComponent *)self fixSuggestionInfo];
}

@end