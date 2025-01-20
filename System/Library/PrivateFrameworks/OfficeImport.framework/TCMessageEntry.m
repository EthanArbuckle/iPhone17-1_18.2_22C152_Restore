@interface TCMessageEntry
+ (void)initialize;
- (BOOL)isEqual:(id)a3;
- (NSString)additionalText;
- (TCMessageEntry)initWithTag:(int)a3 affectedObject:(id)a4 text:(id)a5 parameters:(char *)a6;
- (id)affectedObjects;
- (id)description;
- (id)getMessageText;
- (id)getParameter:(unsigned int)a3;
- (int)getCount;
- (int)getMessageTag;
- (int64_t)timeStampCompare:(id)a3;
- (unint64_t)getParameterCount;
- (unint64_t)hash;
- (unint64_t)timeStamp;
- (void)addAffectedObject:(id)a3;
- (void)mergeEntries:(id)a3;
- (void)setAdditionalText:(id)a3;
- (void)setTimeStamp:(unint64_t)a3;
@end

@implementation TCMessageEntry

+ (void)initialize
{
  if (!percent)
  {
    id v2 = objc_alloc_init(MEMORY[0x263F089C0]);
    v3 = (void *)percent;
    percent = (uint64_t)v2;

    v4 = (void *)percent;
    [v4 addCharactersInString:@"%"];
  }
}

- (TCMessageEntry)initWithTag:(int)a3 affectedObject:(id)a4 text:(id)a5 parameters:(char *)a6
{
  id v10 = a4;
  id v11 = a5;
  v25 = a6;
  v12 = [(TCMessageEntry *)self init];
  v13 = v12;
  if (v12)
  {
    v12->m_tag = a3;
    v12->m_count = 1;
    [(TCMessageEntry *)v12 addAffectedObject:v10];
    v24 = v25;
    uint64_t v14 = [[NSString alloc] initWithFormat:v11 arguments:v25];
    m_text = v13->m_text;
    v13->m_text = (NSString *)v14;

    [v11 length];
    uint64_t v16 = [v11 rangeOfCharacterFromSet:percent];
    for (uint64_t i = v17; v16 != 0x7FFFFFFFFFFFFFFFLL; uint64_t i = v22)
    {
      uint64_t v19 = [v11 length];
      uint64_t v20 = v16 + i;
      int v21 = [v11 characterAtIndex:v20];
      if (v21 != 37 && v21 != 64) {
        break;
      }
      uint64_t v16 = objc_msgSend(v11, "rangeOfCharacterFromSet:options:range:", percent, 0, v20 + 1, v19 - (v20 + 1), v24);
    }
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    id v7 = v4;
    if (self->m_tag == *((_DWORD *)v7 + 4)
      && [(NSString *)self->m_text isEqualToString:*((void *)v7 + 3)])
    {
      v8 = [(TCMessageEntry *)self additionalText];
      v9 = [v7 additionalText];
      if ([v8 isEqualToString:v9])
      {
        m_parameters = self->m_parameters;
        if (m_parameters == *((NSArray **)v7 + 4)) {
          char v6 = 1;
        }
        else {
          char v6 = -[NSArray isEqual:](m_parameters, "isEqual:");
        }
      }
      else
      {
        char v6 = 0;
      }
    }
    else
    {
      char v6 = 0;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  uint64_t m_tag = self->m_tag;
  return [(NSString *)self->m_text hash] ^ m_tag;
}

- (int)getMessageTag
{
  return self->m_tag;
}

- (id)getMessageText
{
  return self->m_text;
}

- (unint64_t)getParameterCount
{
  return [(NSArray *)self->m_parameters count];
}

- (id)getParameter:(unsigned int)a3
{
  if ([(NSArray *)self->m_parameters count] <= a3)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = [(NSArray *)self->m_parameters objectAtIndex:a3];
  }
  return v5;
}

- (id)affectedObjects
{
  return self->m_affectedObjects;
}

- (int)getCount
{
  return self->m_count;
}

- (int64_t)timeStampCompare:(id)a3
{
  unint64_t m_timeStamp = self->m_timeStamp;
  unint64_t v4 = *((void *)a3 + 1);
  BOOL v5 = m_timeStamp >= v4;
  int64_t v6 = m_timeStamp > v4;
  if (v5) {
    return v6;
  }
  else {
    return -1;
  }
}

- (id)description
{
  uint64_t m_count = self->m_count;
  if (m_count == 1)
  {
    v3 = self->m_text;
  }
  else
  {
    v3 = [NSString stringWithFormat:@"%@ (%dx)", self->m_text, m_count];
  }
  return v3;
}

- (void)mergeEntries:(id)a3
{
  id v8 = a3;
  self->m_count += [v8 getCount];
  unint64_t v4 = [v8 affectedObjects];
  if ([v4 count])
  {
    m_affectedObjects = self->m_affectedObjects;
    if (!m_affectedObjects)
    {
      int64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      id v7 = self->m_affectedObjects;
      self->m_affectedObjects = v6;

      m_affectedObjects = self->m_affectedObjects;
    }
    [(NSMutableArray *)m_affectedObjects addObjectsFromArray:v4];
  }
}

- (void)addAffectedObject:(id)a3
{
  id v7 = a3;
  if (v7)
  {
    m_affectedObjects = self->m_affectedObjects;
    if (!m_affectedObjects)
    {
      BOOL v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      int64_t v6 = self->m_affectedObjects;
      self->m_affectedObjects = v5;

      m_affectedObjects = self->m_affectedObjects;
    }
    [(NSMutableArray *)m_affectedObjects addObject:v7];
  }
}

- (NSString)additionalText
{
  return self->additionalText;
}

- (void)setAdditionalText:(id)a3
{
}

- (unint64_t)timeStamp
{
  return self->m_timeStamp;
}

- (void)setTimeStamp:(unint64_t)a3
{
  self->unint64_t m_timeStamp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->additionalText, 0);
  objc_storeStrong((id *)&self->m_affectedObjects, 0);
  objc_storeStrong((id *)&self->m_parameters, 0);
  objc_storeStrong((id *)&self->m_text, 0);
}

@end