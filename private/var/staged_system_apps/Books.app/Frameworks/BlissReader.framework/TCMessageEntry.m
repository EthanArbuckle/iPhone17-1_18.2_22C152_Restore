@interface TCMessageEntry
+ (void)initialize;
- (BOOL)isEqual:(id)a3;
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
- (void)dealloc;
- (void)mergeEntries:(id)a3;
- (void)setTimeStamp:(unint64_t)a3;
@end

@implementation TCMessageEntry

+ (void)initialize
{
  if (!qword_573398)
  {
    id v2 = objc_alloc_init((Class)NSMutableCharacterSet);
    qword_573398 = (uint64_t)v2;
    [v2 addCharactersInString:@"%"];
  }
}

- (TCMessageEntry)initWithTag:(int)a3 affectedObject:(id)a4 text:(id)a5 parameters:(char *)a6
{
  v9 = [(TCMessageEntry *)self init];
  v10 = v9;
  if (v9)
  {
    v9->m_tag = a3;
    v9->m_count = 1;
    [(TCMessageEntry *)v9 addAffectedObject:a4];
    v22 = a6;
    v10->m_text = (NSString *)[objc_alloc((Class)NSString) initWithFormat:a5 arguments:a6];
    [a5 length];
    v11 = (char *)[a5 rangeOfCharacterFromSet:qword_573398];
    if (v11 != (char *)0x7FFFFFFFFFFFFFFFLL)
    {
      int v13 = 0;
      do
      {
        v14 = &v11[v12];
        v15 = [a5 length];
        unsigned int v16 = [a5 characterAtIndex:v14];
        if (v16 != 37)
        {
          if (v16 != 64) {
            break;
          }
          ++v13;
        }
        v11 = [a5 rangeOfCharacterFromSet:qword_573398 options:0 range:v14 + 1, v15 - (v14 + 1)];
      }
      while (v11 != (char *)0x7FFFFFFFFFFFFFFFLL);
      if (v13 >= 1)
      {
        v10->m_parameters = (NSArray *)objc_alloc_init((Class)NSMutableArray);
        do
        {
          v17 = a6;
          a6 += 8;
          m_parameters = v10->m_parameters;
          if (*(void *)v17)
          {
            CFStringRef v19 = (const __CFString *)[*(id *)v17 description];
            v20 = m_parameters;
          }
          else
          {
            v20 = v10->m_parameters;
            CFStringRef v19 = @"(null)";
          }
          [(NSArray *)v20 addObject:v19];
          --v13;
        }
        while (v13);
      }
    }
  }
  return v10;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TCMessageEntry;
  [(TCMessageEntry *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class() && self->m_tag == *((_DWORD *)a3 + 4))
  {
    unsigned int v6 = [(NSString *)self->m_text isEqualToString:*((void *)a3 + 3)];
    if (v6)
    {
      m_parameters = self->m_parameters;
      if (m_parameters == *((NSArray **)a3 + 4))
      {
        LOBYTE(v6) = 1;
      }
      else
      {
        LOBYTE(v6) = -[NSArray isEqual:](m_parameters, "isEqual:");
      }
    }
  }
  else
  {
    LOBYTE(v6) = 0;
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
  if ([(NSArray *)self->m_parameters count] <= a3) {
    return 0;
  }
  m_parameters = self->m_parameters;

  return [(NSArray *)m_parameters objectAtIndex:a3];
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
  if (m_count == 1) {
    return self->m_text;
  }
  else {
    return +[NSString stringWithFormat:@"%@ (%dx)", self->m_text, m_count];
  }
}

- (void)mergeEntries:(id)a3
{
  self->m_count += [a3 getCount];
  id v5 = [a3 affectedObjects];
  if ([v5 count])
  {
    m_affectedObjects = self->m_affectedObjects;
    if (!m_affectedObjects)
    {
      m_affectedObjects = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      self->m_affectedObjects = m_affectedObjects;
    }
    [(NSMutableArray *)m_affectedObjects addObjectsFromArray:v5];
  }
}

- (void)addAffectedObject:(id)a3
{
  if (a3)
  {
    m_affectedObjects = self->m_affectedObjects;
    if (!m_affectedObjects)
    {
      m_affectedObjects = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      self->m_affectedObjects = m_affectedObjects;
    }
    [(NSMutableArray *)m_affectedObjects addObject:a3];
  }
}

- (unint64_t)timeStamp
{
  return self->m_timeStamp;
}

- (void)setTimeStamp:(unint64_t)a3
{
  self->unint64_t m_timeStamp = a3;
}

@end