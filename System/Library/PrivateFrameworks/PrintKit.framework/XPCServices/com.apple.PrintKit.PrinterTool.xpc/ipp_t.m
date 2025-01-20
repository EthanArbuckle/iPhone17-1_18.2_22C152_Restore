@interface ipp_t
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSData)dataRemaining;
- (NSMutableArray)attrs;
- (id)_descriptionLeader;
- (id)_findAttribute0:(id)a3 valueTag:(int)a4;
- (id)_initWithAttrs:(id)a3;
- (id)addNewEmptyAttribute:(id)a3 groupTag:(int)a4 valueTag:(int)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dataRepresentation;
- (id)debugDescription;
- (id)description;
- (id)mutableCopy;
- (id)userCodableDictionary;
- (int)state;
- (ipp_t)init;
- (ipp_t)initWithCoder:(id)a3;
- (ipp_t)initWithData:(id)a3;
- (unint64_t)hash;
- (unsigned)op_or_status;
- (unsigned)request_id;
- (void)_addAttrToAppropriateGroup:(id)a3;
- (void)_addBoolean:(int)a3 name:(id)a4 value:(BOOL)a5;
- (void)_addCollection:(int)a3 name:(id)a4 value:(id)a5;
- (void)_addInteger:(int)a3 valueTag:(int)a4 name:(id)a5 value:(int)a6;
- (void)_addIntegers:(int)a3 valueTag:(int)a4 name:(id)a5 count:(unint64_t)a6 adder:(id)a7;
- (void)_addOctetString:(int)a3 name:(id)a4 data:(const void *)a5 length:(int)a6;
- (void)_addRange:(int)a3 name:(id)a4 lower:(int)a5 upper:(int)a6;
- (void)_addRanges:(int)a3 name:(id)a4 values:(id)a5;
- (void)_addResolution:(int)a3 name:(id)a4 unit:(int)a5 xres:(int)a6 yres:(int)a7;
- (void)_addString:(int)a3 valueTag:(int)a4 name:(id)a5 lang:(id)a6 value:(id)a7;
- (void)_addStrings:(int)a3 valueTag:(int)a4 name:(id)a5 lang:(id)a6 values:(id)a7;
- (void)_deleteAttribute:(id)a3;
- (void)_withGroupingBehavior:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateAttributes:(id)a3;
- (void)replaceOrAddAttribute:(id)a3 withAttribute:(id)a4 settingGroup:(int)a5;
- (void)setOp_or_status:(unsigned __int16)a3;
- (void)setRequest_id:(unsigned int)a3;
- (void)setState:(int)a3;
- (void)withNewAttr:(id)a3 groupTag:(int)a4 valueTag:(int)a5 apply:(id)a6;
@end

@implementation ipp_t

- (ipp_t)init
{
  v6.receiver = self;
  v6.super_class = (Class)ipp_t;
  v2 = [(ipp_t *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    attrs = v2->_attrs;
    v2->_attrs = (NSMutableArray *)v3;
  }
  return v2;
}

- (id)_initWithAttrs:(id)a3
{
  id v4 = a3;
  v5 = [(ipp_t *)self init];
  if (v5)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v14;
      do
      {
        v9 = 0;
        do
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v6);
          }
          attrs = v5->_attrs;
          id v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * (void)v9), "copy", (void)v13);
          [(NSMutableArray *)attrs addObject:v11];

          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }
  }
  return v5;
}

- (void)_addAttrToAppropriateGroup:(id)a3
{
  id v10 = a3;
  id v4 = (char *)[(NSMutableArray *)self->_attrs count];
  unsigned int v5 = objc_msgSend(v10, "group_tag");
  if (!v4) {
    goto LABEL_13;
  }
  unsigned int v6 = v5;
  id v7 = 0;
  unint64_t v8 = -1;
  while (1)
  {
    v9 = [(NSMutableArray *)self->_attrs objectAtIndexedSubscript:v7];
    if (objc_msgSend(v9, "group_tag") != v6) {
      break;
    }
    unint64_t v8 = (unint64_t)++v7;
LABEL_7:

    if (v7 == v4) {
      goto LABEL_10;
    }
  }
  if (v8 == -1)
  {
    ++v7;
    goto LABEL_7;
  }

LABEL_10:
  if (v8 != -1 && v8 < (unint64_t)v4)
  {
    [(NSMutableArray *)self->_attrs insertObject:v10 atIndex:v8];
    goto LABEL_14;
  }
LABEL_13:
  [(NSMutableArray *)self->_attrs addObject:v10];
LABEL_14:
}

- (void)_withGroupingBehavior:(id)a3
{
  id v4 = a3;
  BOOL addAttributesInAppropriateGroups = self->_addAttributesInAppropriateGroups;
  self->_BOOL addAttributesInAppropriateGroups = 1;
  id v6 = v4;
  (*((void (**)(id, ipp_t *))v4 + 2))(v4, self);
  self->_BOOL addAttributesInAppropriateGroups = addAttributesInAppropriateGroups;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ipp_t)initWithCoder:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_dataRepresentation"];
  id v6 = [(ipp_t *)self initWithData:v5];

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [(ipp_t *)self dataRepresentation];
  [v5 encodeObject:v4 forKey:@"_dataRepresentation"];
}

- (id)_descriptionLeader
{
  return @"raw collection";
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)ipp_t;
  uint64_t v3 = [(ipp_t *)&v6 description];
  id v4 = +[NSString stringWithFormat:@"%@ { %d attrs @ %p }", v3, [(NSMutableArray *)self->_attrs count], self->_attrs];

  return v4;
}

- (id)debugDescription
{
  v2 = [(ipp_t *)self userCodableDictionary];
  uint64_t v3 = [v2 allKeys];
  id v4 = [v3 firstObject];

  id v5 = [v2 objectForKeyedSubscript:v4];
  objc_super v6 = +[NSString stringWithFormat:@"%@ { %@ }", v4, v5];

  return v6;
}

- (id)userCodableDictionary
{
  uint64_t v3 = objc_opt_new();
  attrs = self->_attrs;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10003ED88;
  v12[3] = &unk_1000A2C88;
  id v5 = v3;
  id v13 = v5;
  [(NSMutableArray *)attrs enumerateObjectsUsingBlock:v12];
  v11.receiver = self;
  v11.super_class = (Class)ipp_t;
  objc_super v6 = [(ipp_t *)&v11 description];
  id v7 = [(ipp_t *)self _descriptionLeader];
  unint64_t v8 = +[NSString stringWithFormat:@"%@ %@", v6, v7];

  long long v14 = v8;
  id v15 = v5;
  v9 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];

  return v9;
}

- (void)enumerateAttributes:(id)a3
{
  id v4 = a3;
  attrs = self->_attrs;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003EEA4;
  v7[3] = &unk_1000A2CB0;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableArray *)attrs enumerateObjectsUsingBlock:v7];
}

- (void)replaceOrAddAttribute:(id)a3 withAttribute:(id)a4 settingGroup:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  id v9 = a4;
  attrs = self->_attrs;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10003EFE4;
  v15[3] = &unk_1000A2CD8;
  id v11 = v8;
  id v16 = v11;
  id v12 = [(NSMutableArray *)attrs indexOfObjectPassingTest:v15];
  id v13 = [v9 _copySettingGroup:v5];
  long long v14 = self->_attrs;
  if (v12 == (id)0x7FFFFFFFFFFFFFFFLL) {
    [(NSMutableArray *)v14 addObject:v13];
  }
  else {
    [(NSMutableArray *)v14 replaceObjectAtIndex:v12 withObject:v13];
  }
}

- (ipp_t)initWithData:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ipp_t *)self init];
  if (v5)
  {
    uint64_t v17 = 0;
    id v6 = v4;
    id v18 = v6;
    [(ipp_t *)v5 setState:0];
    do
    {
      int IO = ippReadIO((uint64_t)&v17, (uint64_t (*)(void *, unsigned __int8 *, unint64_t))sub_10003F1BC, v5);
      int v9 = IO;
    }
    while (IO != -1 && IO != 3);
    if (v9 == 3)
    {
      id v11 = [v6 length];
      if ((uint64_t)v11 - v17 < 1)
      {
LABEL_15:

        goto LABEL_16;
      }
      uint64_t v12 = objc_msgSend(v6, "subdataWithRange:");
      dataRemaining = v5->_dataRemaining;
      v5->_dataRemaining = (NSData *)v12;
    }
    else
    {
      long long v14 = _PKLogCategory(PKLogCategoryDefault[0]);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v16 = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Couldn't convert data to ipp", v16, 2u);
      }

      dataRemaining = v5;
      uint64_t v5 = 0;
    }

    goto LABEL_15;
  }
LABEL_16:

  return v5;
}

- (id)dataRepresentation
{
  [(ipp_t *)self setState:0];
  uint64_t v3 = +[NSMutableData dataWithCapacity:0];
  ippWriteIO(v3, (uint64_t (*)(void *, unsigned __int8 *, unint64_t))sub_10003F2BC, self);

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ipp_t *)self dataRepresentation];
  id v6 = [v4 dataRepresentation];
  unsigned __int8 v7 = [v5 isEqual:v6];

  return v7;
}

- (unint64_t)hash
{
  v2 = [(ipp_t *)self dataRepresentation];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v3 = [(ipp_t *)self dataRepresentation];
  id v4 = [objc_alloc((Class)objc_opt_class()) initWithData:v3];

  return v4;
}

- (id)mutableCopy
{
  return [(ipp_t *)self copyWithZone:0];
}

- (void)withNewAttr:(id)a3 groupTag:(int)a4 valueTag:(int)a5 apply:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = *(void *)&a4;
  id v12 = a3;
  id v10 = (void (**)(id, ipp_attribute_t *))a6;
  id v11 = [[ipp_attribute_t alloc] initWithName:v12 group:v8 value:v7];
  v10[2](v10, v11);
  if (self->_addAttributesInAppropriateGroups) {
    [(ipp_t *)self _addAttrToAppropriateGroup:v11];
  }
  else {
    [(NSMutableArray *)self->_attrs addObject:v11];
  }
}

- (id)addNewEmptyAttribute:(id)a3 groupTag:(int)a4 valueTag:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  int v9 = [[ipp_attribute_t alloc] initWithName:v8 group:v6 value:v5];
  if (self->_addAttributesInAppropriateGroups) {
    [(ipp_t *)self _addAttrToAppropriateGroup:v9];
  }
  else {
    [(NSMutableArray *)self->_attrs addObject:v9];
  }

  return v9;
}

- (void)_addRange:(int)a3 name:(id)a4 lower:(int)a5 upper:(int)a6
{
  uint64_t v8 = *(void *)&a3;
  id v10 = a4;
  if (v10 && v8 <= 5 && v8 != 3)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10003F69C;
    v11[3] = &unk_1000A2D18;
    int v12 = a5;
    int v13 = a6;
    [(ipp_t *)self withNewAttr:v10 groupTag:v8 valueTag:51 apply:v11];
  }
}

- (void)_addRanges:(int)a3 name:(id)a4 values:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (v8 && v6 <= 5 && v6 != 3 && [v9 count])
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10003F840;
    v11[3] = &unk_1000A2D98;
    id v12 = v10;
    [(ipp_t *)self withNewAttr:v8 groupTag:v6 valueTag:51 apply:v11];
  }
}

- (void)_addBoolean:(int)a3 name:(id)a4 value:(BOOL)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  if (v8 && v6 <= 5 && v6 != 3)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10003FA90;
    v9[3] = &unk_1000A2DD8;
    BOOL v10 = a5;
    [(ipp_t *)self withNewAttr:v8 groupTag:v6 valueTag:34 apply:v9];
  }
}

- (void)_addInteger:(int)a3 valueTag:(int)a4 name:(id)a5 value:(int)a6
{
  uint64_t v7 = *(void *)&a4;
  uint64_t v8 = *(void *)&a3;
  id v10 = a5;
  if (v10 && v8 <= 5 && v8 != 3)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10003FBE4;
    v11[3] = &unk_1000A2E18;
    int v12 = a6;
    [(ipp_t *)self withNewAttr:v10 groupTag:v8 valueTag:v7 apply:v11];
  }
}

- (void)_addString:(int)a3 valueTag:(int)a4 name:(id)a5 lang:(id)a6 value:(id)a7
{
  uint64_t v9 = *(void *)&a4;
  uint64_t v10 = *(void *)&a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  id v15 = v14;
  if (v14 && v10 <= 5 && v10 != 3)
  {
    id v17 = v14;
    id v16 = +[NSArray arrayWithObjects:&v17 count:1];
    [(ipp_t *)self _addStrings:v10 valueTag:v9 name:v12 lang:v13 values:v16];
  }
}

- (void)_addStrings:(int)a3 valueTag:(int)a4 name:(id)a5 lang:(id)a6 values:(id)a7
{
  uint64_t v9 = *(void *)&a4;
  uint64_t v10 = *(void *)&a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  id v15 = v14;
  if (v12 && v10 <= 5 && v10 != 3 && [v14 count])
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10003FEC0;
    v16[3] = &unk_1000A2E70;
    id v17 = v15;
    id v18 = v13;
    int v19 = v9;
    [(ipp_t *)self withNewAttr:v12 groupTag:v10 valueTag:v9 apply:v16];
  }
}

- (void)_addCollection:(int)a3 name:(id)a4 value:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = v9;
  if (v8 && v6 <= 5 && v6 != 3)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10004038C;
    v11[3] = &unk_1000A2D98;
    id v12 = v9;
    [(ipp_t *)self withNewAttr:v8 groupTag:v6 valueTag:52 apply:v11];
  }
}

- (void)_addResolution:(int)a3 name:(id)a4 unit:(int)a5 xres:(int)a6 yres:(int)a7
{
  uint64_t v10 = *(void *)&a3;
  id v12 = a4;
  if (v12
    && v10 <= 5
    && v10 != 3
    && ((a7 | a6) & 0x80000000) == 0
    && (a5 - 5) >= 0xFFFFFFFE)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100040528;
    v13[3] = &unk_1000A2ED8;
    int v14 = a6;
    int v15 = a7;
    int v16 = a5;
    [(ipp_t *)self withNewAttr:v12 groupTag:v10 valueTag:50 apply:v13];
  }
}

- (void)_addOctetString:(int)a3 name:(id)a4 data:(const void *)a5 length:(int)a6
{
  uint64_t v8 = *(void *)&a3;
  id v10 = a4;
  if (v10 && v8 <= 5 && v8 != 3 && !(a6 >> 15))
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100040694;
    v11[3] = &unk_1000A2ED8;
    void v11[4] = a5;
    int v12 = a6;
    [(ipp_t *)self withNewAttr:v10 groupTag:v8 valueTag:48 apply:v11];
  }
}

- (void)_deleteAttribute:(id)a3
{
  id v5 = a3;
  id v4 = -[NSMutableArray indexOfObject:](self->_attrs, "indexOfObject:");
  if (v4 != (id)0x7FFFFFFFFFFFFFFFLL) {
    [(NSMutableArray *)self->_attrs removeObjectAtIndex:v4];
  }
}

- (void)_addIntegers:(int)a3 valueTag:(int)a4 name:(id)a5 count:(unint64_t)a6 adder:(id)a7
{
  uint64_t v9 = *(void *)&a4;
  uint64_t v10 = *(void *)&a3;
  id v12 = a5;
  id v13 = a7;
  int v14 = v13;
  if (v12 && v10 <= 5 && v10 != 3 && a6)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100040928;
    v15[3] = &unk_1000A2F28;
    id v16 = v13;
    unint64_t v17 = a6;
    [(ipp_t *)self withNewAttr:v12 groupTag:v10 valueTag:v9 apply:v15];
  }
}

- (id)_findAttribute0:(id)a3 valueTag:(int)a4
{
  id v6 = a3;
  uint64_t v7 = v6;
  if (v6)
  {
    uint64_t v15 = 0;
    id v16 = &v15;
    uint64_t v17 = 0x3032000000;
    id v18 = sub_100040C08;
    int v19 = sub_100040C18;
    id v20 = 0;
    [v6 lowercaseString];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100040C20;
    v11[3] = &unk_1000A2F50;
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    id v13 = &v15;
    int v14 = a4;
    id v8 = v12;
    [(ipp_t *)self enumerateAttributes:v11];
    id v9 = (id)v16[5];

    _Block_object_dispose(&v15, 8);
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (NSData)dataRemaining
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (int)state
{
  return self->_state;
}

- (void)setState:(int)a3
{
  self->_state = a3;
}

- (unsigned)request_id
{
  return self->_request_id;
}

- (void)setRequest_id:(unsigned int)a3
{
  self->_request_id = a3;
}

- (unsigned)op_or_status
{
  return self->_op_or_status;
}

- (void)setOp_or_status:(unsigned __int16)a3
{
  self->_op_or_status = a3;
}

- (NSMutableArray)attrs
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataRemaining, 0);

  objc_storeStrong((id *)&self->_attrs, 0);
}

@end