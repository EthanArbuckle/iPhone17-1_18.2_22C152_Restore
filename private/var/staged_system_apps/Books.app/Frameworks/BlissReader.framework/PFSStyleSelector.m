@interface PFSStyleSelector
+ (id)allElementsSelector;
- (BOOL)isEqual:(id)a3;
- (BOOL)matchesTailOf:(id)a3;
- (PFSStyleSelector)init;
- (PFSStyleSelector)initWithParseOrder:(unint64_t)a3;
- (const)simpleSelectors;
- (int)characterClass:(unsigned __int16)a3;
- (unint64_t)hash;
- (unint64_t)specificity;
- (void)addSimpleSelector;
- (void)curSimpleSelector;
- (void)dealloc;
- (void)freeze;
@end

@implementation PFSStyleSelector

+ (id)allElementsSelector
{
  id result = (id)qword_573480;
  if (!qword_573480)
  {
    qword_573480 = objc_alloc_init(PFSStyleSelector);
    sub_1FA73C((uint64_t *)[(id)qword_573480 addSimpleSelector], 33, "*", 1);
    [(id)qword_573480 freeze];
    return (id)qword_573480;
  }
  return result;
}

- (PFSStyleSelector)initWithParseOrder:(unint64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PFSStyleSelector;
  v4 = [(PFSStyleSelector *)&v6 init];
  if (v4)
  {
    v4->m_parseOrder = a3;
    operator new();
  }
  return 0;
}

- (PFSStyleSelector)init
{
  return [(PFSStyleSelector *)self initWithParseOrder:0];
}

- (void)dealloc
{
  m_simpleSelectors = self->m_simpleSelectors;
  uint64_t v4 = m_simpleSelectors[1];
  if ((void *)v4 == m_simpleSelectors) {
    goto LABEL_6;
  }
  do
  {
    v5 = *(PFSStyleSimpleSelector **)(v4 + 16);
    if (v5)
    {
      PFSStyleSimpleSelector::~PFSStyleSimpleSelector(v5);
      operator delete();
    }
    *(void *)(v4 + 16) = 0;
    uint64_t v4 = *(void *)(v4 + 8);
  }
  while ((void *)v4 != m_simpleSelectors);
  m_simpleSelectors = self->m_simpleSelectors;
  if (m_simpleSelectors)
  {
LABEL_6:
    sub_1EE5FC(m_simpleSelectors);
    operator delete();
  }
  self->m_simpleSelectors = 0;
  v6.receiver = self;
  v6.super_class = (Class)PFSStyleSelector;
  [(PFSStyleSelector *)&v6 dealloc];
}

- (void)freeze
{
  if (!self->m_frozen)
  {
    unint64_t v2 = 2166136261;
    self->m_hash = 2166136261;
    m_simpleSelectors = self->m_simpleSelectors;
    for (i = (void *)m_simpleSelectors[1]; i != m_simpleSelectors; i = (void *)i[1])
    {
      uint64_t v5 = 0;
      uint64_t v6 = i[2];
      *(unsigned char *)(v6 + 32) = 1;
      uint64_t v7 = *(void *)(v6 + 24);
      do
        unint64_t v2 = 16777619 * (v2 ^ *((char *)&v7 + v5++));
      while (v5 != 8);
      self->m_hash = v2;
    }
    self->m_frozen = 1;
  }
}

- (unint64_t)hash
{
  return self->m_hash;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if (self->m_hash == *((void *)a3 + 3))
    {
      uint64_t v6 = *((void *)a3 + 1);
      m_simpleSelectors = self->m_simpleSelectors;
      v8 = m_simpleSelectors;
      uint64_t v9 = v6;
      while (1)
      {
        uint64_t v9 = *(void *)(v9 + 8);
        v8 = (void *)*((void *)v8 + 1);
        if (v8 == m_simpleSelectors || v9 == v6) {
          break;
        }
        if (!PFSStyleSimpleSelector::isEqualTo(*((PFSStyleSimpleSelector **)v8 + 2), *(const PFSStyleSimpleSelector **)(v9 + 16)))goto LABEL_9; {
      }
        }
      LOBYTE(v5) = v8 == m_simpleSelectors && v9 == v6;
    }
    else
    {
LABEL_9:
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (BOOL)matchesTailOf:(id)a3
{
  v3 = (uint64_t *)*((void *)a3 + 1);
  m_simpleSelectors = self->m_simpleSelectors;
  unsigned int v5 = (void *)*((void *)m_simpleSelectors + 1);
  uint64_t v6 = (uint64_t *)v3[1];
  while (1)
  {
    BOOL result = m_simpleSelectors == v5;
    if (m_simpleSelectors == v5 || v3 == v6) {
      break;
    }
    m_simpleSelectors = *(void **)m_simpleSelectors;
    v3 = (uint64_t *)*v3;
    if (!PFSStyleSimpleSelector::isSubsetOf(*((PFSStyleSimpleSelector **)m_simpleSelectors + 2), (const PFSStyleSimpleSelector *)v3[2]))return 0; {
  }
    }
  return result;
}

- (int)characterClass:(unsigned __int16)a3
{
  if ((unsigned __int16)PFXChA <= a3 && (unsigned __int16)PFXChZ >= a3) {
    return 0;
  }
  if ((unsigned __int16)PFXCha <= a3 && (unsigned __int16)PFXChz >= a3) {
    return 0;
  }
  BOOL v5 = (unsigned __int16)PFXCh9 < a3 || (unsigned __int16)PFXCh0 > a3;
  BOOL v6 = !v5 || (unsigned __int16)PFXChDash == a3;
  BOOL v7 = v6 || (unsigned __int16)PFXChUnderscore == a3;
  BOOL v8 = v7 || (unsigned __int16)PFXChTilde == a3;
  if (v8 || (unsigned __int16)PFXChColon == a3) {
    return 0;
  }
  if ((unsigned __int16)PFXChPeriod == a3) {
    return 1;
  }
  if ((unsigned __int16)PFXChHash == a3) {
    return 3;
  }
  if ((unsigned __int16)PFXChOpenSquareBracket == a3) {
    return 4;
  }
  if ((unsigned __int16)PFXChCloseSquareBracket == a3) {
    return 5;
  }
  return 6;
}

- (void)addSimpleSelector
{
}

- (void)curSimpleSelector
{
  m_simpleSelectors = self->m_simpleSelectors;
  if (m_simpleSelectors[2]) {
    return *(void **)(*m_simpleSelectors + 16);
  }
  else {
    return 0;
  }
}

- (unint64_t)specificity
{
  m_simpleSelectors = self->m_simpleSelectors;
  v3 = (void *)m_simpleSelectors[1];
  if (v3 == m_simpleSelectors)
  {
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v4 = 0;
    do
    {
      BOOL v5 = v3 + 1;
      v3 = (void *)v3[1];
      v4 += *(unsigned int *)(v5[1] + 36);
    }
    while (v3 != m_simpleSelectors);
    uint64_t v6 = v4 << 32;
  }
  return self->m_parseOrder + v6;
}

- (const)simpleSelectors
{
  return self->m_simpleSelectors;
}

@end