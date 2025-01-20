@interface VMUDomtreeName
- (BOOL)isEqual:(id)a3;
- (VMUDomtreeName)initWithArray:(id)a3;
- (VMUDomtreeName)initWithDict:(id)a3;
- (id)asArray;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation VMUDomtreeName

- (VMUDomtreeName)initWithDict:(id)a3
{
  for (uint64_t i = 0; i != 6; ++i)
  {
    v6 = [a3 objectForKeyedSubscript:name_keys[i]];
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      v8 = [MEMORY[0x1E4F1CA98] null];
    }
    v9 = self->_elements[i];
    self->_elements[i] = v8;
  }
  return self;
}

- (VMUDomtreeName)initWithArray:(id)a3
{
  id v4 = a3;
  unint64_t v5 = -6;
  uint64_t v6 = 8;
  while (v5 + 6 < [v4 count])
  {
    v7 = [v4 objectAtIndexedSubscript:v5 + 6];
    v8 = *(Class *)((char *)&self->super.isa + v6);
    *(Class *)((char *)&self->super.isa + v6) = v7;

    v6 += 8;
    if (__CFADD__(v5++, 1)) {
      goto LABEL_8;
    }
  }
  if (v5 >= 0xFFFFFFFFFFFFFFFALL)
  {
    do
    {
      v10 = [MEMORY[0x1E4F1CA98] null];
      v11 = *(Class *)((char *)&self->super.isa + v6);
      *(Class *)((char *)&self->super.isa + v6) = v10;

      v6 += 8;
    }
    while (v6 != 56);
  }
LABEL_8:

  return self;
}

- (id)asArray
{
  uint64_t v2 = 6;
  do
  {
    uint64_t v3 = v2;
    if (!v2) {
      break;
    }
    --v2;
  }
  while (!*((void *)&self->super.isa + v3));
  return (id)[MEMORY[0x1E4F1C978] arrayWithObjects:self->_elements count:v3];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (id *)a3;
  unint64_t v5 = [MEMORY[0x1E4F1CA98] null];
  uint64_t v6 = self->_elements[0];
  v7 = (NSCopying *)v4[1];
  if ((v6 != v5) == (v7 == v5))
  {
    BOOL v9 = 0;
  }
  else
  {
    unint64_t v8 = 0;
    BOOL v9 = 0;
    v10 = &self->_elements[1];
    while ([(NSCopying *)v6 isEqual:v7])
    {

      if (v8 == 5)
      {
        BOOL v9 = 1;
        goto LABEL_9;
      }
      BOOL v9 = v8 > 4;
      uint64_t v6 = v10[v8];
      v7 = (NSCopying *)v4[v8++ + 2];
      if ((v6 != v5) == (v7 == v5)) {
        break;
      }
    }
  }

LABEL_9:
  return v9;
}

- (unint64_t)hash
{
  uint64_t v3 = [MEMORY[0x1E4F1CA98] null];
  unint64_t v4 = 0;
  for (uint64_t i = 8; i != 56; i += 8)
  {
    uint64_t v6 = *(Class *)((char *)&self->super.isa + i);
    if (v6 != v3) {
      v4 += [v6 hash];
    }
  }

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v4 = +[VMUDomtreeName allocWithZone:a3];
  for (uint64_t i = 8; i != 56; i += 8)
    objc_storeStrong((id *)((char *)&v4->super.isa + i), *(id *)((char *)&self->super.isa + i));
  return v4;
}

- (void).cxx_destruct
{
  uint64_t v3 = 48;
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + v3), 0);
    v3 -= 8;
  }
  while (v3);
}

@end