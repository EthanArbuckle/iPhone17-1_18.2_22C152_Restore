@interface kjAS9HuCdR1m5txL
+ (BOOL)supportsSecureCoding;
+ (id)Xw2iAzNBHudJx7Ph:(id)a3;
+ (id)cR9LfsxC1Nz4IZKu;
- (BOOL)rEI50SHLlVc37Bvu;
- (NSArray)GyF0atX3JpCKc9pK;
- (NSDate)wgZJLy8f4tn41Pge;
- (id)lL9A0cjB5y6UgZsI;
- (id)serializeDataframeWithSecureCoding;
- (int64_t)qfSDGTGvqd3Hruzg;
- (int64_t)yOtBxuHAYKqZrNQN;
- (kjAS9HuCdR1m5txL)initWithCoder:(id)a3;
- (kjAS9HuCdR1m5txL)initWithGyF0atX3JpCKc9pK:(id)a3 qfSDGTGvqd3Hruzg:(int64_t)a4;
- (unint64_t)JmiV9VW8P3Gxz1H7;
- (void)encodeWithCoder:(id)a3;
- (void)setGyF0atX3JpCKc9pK:(id)a3;
- (void)setJmiV9VW8P3Gxz1H7:(unint64_t)a3;
- (void)setQfSDGTGvqd3Hruzg:(int64_t)a3;
- (void)setWgZJLy8f4tn41Pge:(id)a3;
- (void)setYOtBxuHAYKqZrNQN:(int64_t)a3;
@end

@implementation kjAS9HuCdR1m5txL

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  v4 = [(kjAS9HuCdR1m5txL *)self wgZJLy8f4tn41Pge];
  [v6 encodeObject:v4 forKey:@"eV93XIm2DFoleW67"];

  [v6 encodeInteger:-[kjAS9HuCdR1m5txL yOtBxuHAYKqZrNQN](self, "yOtBxuHAYKqZrNQN") forKey:@"PVyDYKUBXCVAefL3"];
  [v6 encodeInteger:-[kjAS9HuCdR1m5txL qfSDGTGvqd3Hruzg](self, "qfSDGTGvqd3Hruzg") forKey:@"unDWoRY4KcYFWF2p"];
  v5 = [(kjAS9HuCdR1m5txL *)self GyF0atX3JpCKc9pK];
  [v6 encodeObject:v5 forKey:@"z3Urd7zeB4LQNdm7"];

  [v6 encodeInteger:-[kjAS9HuCdR1m5txL JmiV9VW8P3Gxz1H7](self, "JmiV9VW8P3Gxz1H7") forKey:@"t5wyajVqKFbSCYB6"];
}

- (kjAS9HuCdR1m5txL)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)kjAS9HuCdR1m5txL;
  v5 = [(kjAS9HuCdR1m5txL *)&v11 init];
  if (v5)
  {
    v12[0] = objc_opt_class();
    v12[1] = objc_opt_class();
    v12[2] = objc_opt_class();
    v12[3] = objc_opt_class();
    v12[4] = objc_opt_class();
    v12[5] = objc_opt_class();
    v12[6] = objc_opt_class();
    v12[7] = objc_opt_class();
    id v6 = +[NSArray arrayWithObjects:v12 count:8];
    v7 = +[NSSet setWithArray:v6];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"eV93XIm2DFoleW67"];
    [(kjAS9HuCdR1m5txL *)v5 setWgZJLy8f4tn41Pge:v8];

    -[kjAS9HuCdR1m5txL setYOtBxuHAYKqZrNQN:](v5, "setYOtBxuHAYKqZrNQN:", [v4 decodeIntegerForKey:@"PVyDYKUBXCVAefL3"]);
    -[kjAS9HuCdR1m5txL setQfSDGTGvqd3Hruzg:](v5, "setQfSDGTGvqd3Hruzg:", [v4 decodeIntegerForKey:@"unDWoRY4KcYFWF2p"]);
    v9 = [v4 decodeObjectOfClasses:v7 forKey:@"z3Urd7zeB4LQNdm7"];
    [(kjAS9HuCdR1m5txL *)v5 setGyF0atX3JpCKc9pK:v9];

    -[kjAS9HuCdR1m5txL setJmiV9VW8P3Gxz1H7:](v5, "setJmiV9VW8P3Gxz1H7:", [v4 decodeIntegerForKey:@"t5wyajVqKFbSCYB6"]);
  }

  return v5;
}

+ (id)cR9LfsxC1Nz4IZKu
{
  v2 = [[kjAS9HuCdR1m5txL alloc] initWithGyF0atX3JpCKc9pK:&__NSArray0__struct qfSDGTGvqd3Hruzg:149];

  return v2;
}

+ (id)Xw2iAzNBHudJx7Ph:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v4 = [objc_alloc((Class)NSData) initWithBase64EncodedString:v3 options:3];

    uint64_t v5 = objc_opt_class();
    id v6 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v5, objc_opt_class(), 0);
    id v34 = 0;
    v7 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v6 fromData:v4 error:&v34];
    id v8 = v34;
    if (v8)
    {
      v9 = v8;
      v10 = qword_1006AD1A0;
      if (os_log_type_enabled((os_log_t)qword_1006AD1A0, OS_LOG_TYPE_ERROR)) {
        sub_10055DCA8((uint64_t)v9, v10, v11, v12, v13, v14, v15, v16);
      }
      id v33 = 0;
      v17 = +[NSPropertyListSerialization propertyListWithData:v4 options:0 format:0 error:&v33];
      id v18 = v33;

      if (v18)
      {
        v19 = qword_1006AD1A0;
        if (os_log_type_enabled((os_log_t)qword_1006AD1A0, OS_LOG_TYPE_ERROR)) {
          sub_10055DC3C((uint64_t)v18, v19, v20, v21, v22, v23, v24, v25);
        }
        v26 = 0;
      }
      else
      {
        v27 = [kjAS9HuCdR1m5txL alloc];
        v28 = [v17 objectForKeyedSubscript:@"Yaq6qLPClqGRAXCx"];
        v29 = [v17 objectForKeyedSubscript:@"iVmTzX1ymXOWRKrv"];
        v26 = -[kjAS9HuCdR1m5txL initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:](v27, "initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:", v28, [v29 integerValue]);

        v30 = [v17 objectForKeyedSubscript:@"14ornzG9W3NaJVpK"];
        -[kjAS9HuCdR1m5txL setYOtBxuHAYKqZrNQN:](v26, "setYOtBxuHAYKqZrNQN:", [v30 integerValue]);

        v31 = [v17 objectForKeyedSubscript:@"mYBuACT5pLzJb26c"];
        [(kjAS9HuCdR1m5txL *)v26 setWgZJLy8f4tn41Pge:v31];
      }
    }
    else
    {
      v26 = v7;
    }
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (kjAS9HuCdR1m5txL)initWithGyF0atX3JpCKc9pK:(id)a3 qfSDGTGvqd3Hruzg:(int64_t)a4
{
  self->_qfSDGTGvqd3Hruzg = a4;
  self->_yOtBxuHAYKqZrNQN = 0;
  self->_JmiV9VW8P3Gxz1H7 = -1;
  return self;
}

- (id)serializeDataframeWithSecureCoding
{
  id v12 = 0;
  v2 = +[NSKeyedArchiver archivedDataWithRootObject:self requiringSecureCoding:1 error:&v12];
  id v3 = v12;
  if (v3)
  {
    id v4 = qword_1006AD1A0;
    if (os_log_type_enabled((os_log_t)qword_1006AD1A0, OS_LOG_TYPE_ERROR)) {
      sub_10055DD14((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }

  return v2;
}

- (id)lL9A0cjB5y6UgZsI
{
  return [(kjAS9HuCdR1m5txL *)self serializeDataframeWithSecureCoding];
}

- (BOOL)rEI50SHLlVc37Bvu
{
  return !self->_qfSDGTGvqd3Hruzg && self->_GyF0atX3JpCKc9pK != 0;
}

- (NSArray)GyF0atX3JpCKc9pK
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setGyF0atX3JpCKc9pK:(id)a3
{
}

- (int64_t)qfSDGTGvqd3Hruzg
{
  return self->_qfSDGTGvqd3Hruzg;
}

- (void)setQfSDGTGvqd3Hruzg:(int64_t)a3
{
  self->_qfSDGTGvqd3Hruzg = a3;
}

- (int64_t)yOtBxuHAYKqZrNQN
{
  return self->_yOtBxuHAYKqZrNQN;
}

- (void)setYOtBxuHAYKqZrNQN:(int64_t)a3
{
  self->_yOtBxuHAYKqZrNQN = a3;
}

- (NSDate)wgZJLy8f4tn41Pge
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (void)setWgZJLy8f4tn41Pge:(id)a3
{
}

- (unint64_t)JmiV9VW8P3Gxz1H7
{
  return self->_JmiV9VW8P3Gxz1H7;
}

- (void)setJmiV9VW8P3Gxz1H7:(unint64_t)a3
{
  self->_JmiV9VW8P3Gxz1H7 = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wgZJLy8f4tn41Pge, 0);

  objc_storeStrong((id *)&self->_GyF0atX3JpCKc9pK, 0);
}

@end