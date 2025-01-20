@interface BKDisplayCloneRecord
- (BOOL)isEqual:(id)a3;
- (unint64_t)hash;
@end

@implementation BKDisplayCloneRecord

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_destinationDisplay, 0);

  objc_storeStrong((id *)&self->_sourceDisplay, 0);
}

- (unint64_t)hash
{
  return (unint64_t)[(CAWindowServerDisplay *)self->_destinationDisplay hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      v7 = v6;
    }
    else {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }
  id v8 = v7;

  if (v8
    && (unsigned int v9 = [(CAWindowServerDisplay *)self->_sourceDisplay displayId],
        v9 == [*((id *)v8 + 2) displayId])
    && (unsigned int v10 = [(CAWindowServerDisplay *)self->_destinationDisplay displayId],
        v10 == [*((id *)v8 + 3) displayId])
    && self->_clientPID == *((_DWORD *)v8 + 2))
  {
    unsigned __int8 v11 = [(NSDictionary *)self->_options isEqual:*((void *)v8 + 4)];
  }
  else
  {
    unsigned __int8 v11 = 0;
  }

  return v11;
}

@end