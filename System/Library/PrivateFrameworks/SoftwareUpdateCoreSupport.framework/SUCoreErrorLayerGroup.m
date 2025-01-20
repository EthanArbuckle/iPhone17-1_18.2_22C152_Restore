@interface SUCoreErrorLayerGroup
- (NSDictionary)keyMatchTrueMap;
- (NSString)domain;
- (NSString)keyMatchTrue;
- (id)description;
- (id)initForLayer:(int64_t)a3 withDomain:(id)a4;
- (id)initForLayer:(int64_t)a3 withDomain:(id)a4 minCode:(int64_t)a5 maxCode:(int64_t)a6;
- (id)initForLayer:(int64_t)a3 withDomain:(id)a4 minCode:(int64_t)a5 maxCode:(int64_t)a6 indicating:(int64_t)a7 ifKeyTrue:(id)a8 keyMatchTrueMap:(id)a9;
- (id)summary;
- (int64_t)errorLayer;
- (int64_t)indications;
- (int64_t)maxCode;
- (int64_t)minCode;
- (void)setIndications:(int64_t)a3;
- (void)setKeyMatchTrue:(id)a3;
- (void)setKeyMatchTrueMap:(id)a3;
@end

@implementation SUCoreErrorLayerGroup

- (id)initForLayer:(int64_t)a3 withDomain:(id)a4 minCode:(int64_t)a5 maxCode:(int64_t)a6 indicating:(int64_t)a7 ifKeyTrue:(id)a8 keyMatchTrueMap:(id)a9
{
  id v15 = a4;
  id v16 = a8;
  id v17 = a9;
  v22.receiver = self;
  v22.super_class = (Class)SUCoreErrorLayerGroup;
  v18 = [(SUCoreErrorLayerGroup *)&v22 init];
  v19 = v18;
  if (v18)
  {
    v18->_errorLayer = a3;
    objc_storeStrong((id *)&v18->_domain, a4);
    v19->_minCode = a5;
    v19->_maxCode = a6;
    v19->_indications = a7;
    objc_storeStrong((id *)&v19->_keyMatchTrue, a8);
    objc_storeStrong((id *)&v19->_keyMatchTrueMap, a9);
  }

  return v19;
}

- (NSString)domain
{
  return self->_domain;
}

- (id)initForLayer:(int64_t)a3 withDomain:(id)a4
{
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SUCoreErrorLayerGroup;
  v8 = [(SUCoreErrorLayerGroup *)&v13 init];
  v9 = v8;
  if (v8)
  {
    v8->_errorLayer = a3;
    objc_storeStrong((id *)&v8->_domain, a4);
    v9->_minCode = -1;
    v9->_maxCode = -1;
    keyMatchTrue = v9->_keyMatchTrue;
    v9->_indications = 0;
    v9->_keyMatchTrue = 0;

    keyMatchTrueMap = v9->_keyMatchTrueMap;
    v9->_keyMatchTrueMap = 0;
  }
  return v9;
}

- (id)initForLayer:(int64_t)a3 withDomain:(id)a4 minCode:(int64_t)a5 maxCode:(int64_t)a6
{
  id v11 = a4;
  v17.receiver = self;
  v17.super_class = (Class)SUCoreErrorLayerGroup;
  v12 = [(SUCoreErrorLayerGroup *)&v17 init];
  objc_super v13 = v12;
  if (v12)
  {
    v12->_errorLayer = a3;
    objc_storeStrong((id *)&v12->_domain, a4);
    v13->_minCode = a5;
    v13->_maxCode = a6;
    keyMatchTrue = v13->_keyMatchTrue;
    v13->_indications = 0;
    v13->_keyMatchTrue = 0;

    keyMatchTrueMap = v13->_keyMatchTrueMap;
    v13->_keyMatchTrueMap = 0;
  }
  return v13;
}

- (id)summary
{
  id v3 = [NSString alloc];
  v4 = +[SUCoreErrorInformation nameForSUCoreLayer:[(SUCoreErrorLayerGroup *)self errorLayer]];
  v5 = [(SUCoreErrorLayerGroup *)self domain];
  int64_t v6 = [(SUCoreErrorLayerGroup *)self minCode];
  int64_t v7 = [(SUCoreErrorLayerGroup *)self maxCode];
  int64_t v8 = [(SUCoreErrorLayerGroup *)self indications];
  v9 = @"DEFINED";
  if (!v8) {
    v9 = @"NONE";
  }
  v10 = (void *)[v3 initWithFormat:@"SUCoreErrorLayerGroup(layer=%@,domain=%@,minCode=%d,maxCode=%d,indications=%@)", v4, v5, v6, v7, v9];

  return v10;
}

- (id)description
{
  id v3 = [NSString alloc];
  v4 = +[SUCoreErrorInformation nameForSUCoreLayer:[(SUCoreErrorLayerGroup *)self errorLayer]];
  v5 = [(SUCoreErrorLayerGroup *)self domain];
  int64_t v6 = [(SUCoreErrorLayerGroup *)self minCode];
  int64_t v7 = [(SUCoreErrorLayerGroup *)self maxCode];
  int64_t v8 = [(SUCoreErrorLayerGroup *)self indications];
  v9 = [(SUCoreErrorLayerGroup *)self keyMatchTrue];
  if (v9)
  {
    v10 = [(SUCoreErrorLayerGroup *)self keyMatchTrue];
  }
  else
  {
    v10 = @"NONE";
  }
  id v11 = [(SUCoreErrorLayerGroup *)self keyMatchTrueMap];
  v12 = @"DEFINED";
  if (!v11) {
    v12 = @"NONE";
  }
  objc_super v13 = (void *)[v3 initWithFormat:@"\n[>>>\n              layer: %@\n             domain: %@\n            minCode: %d\n            maxCode: %d\n        indications: 0x%08llX\n       keyMatchTrue: %@\n    keyMatchTrueMap: %@\n<<<]", v4, v5, v6, v7, v8, v10, v12];

  if (v9) {
  return v13;
  }
}

- (int64_t)errorLayer
{
  return self->_errorLayer;
}

- (int64_t)minCode
{
  return self->_minCode;
}

- (int64_t)maxCode
{
  return self->_maxCode;
}

- (int64_t)indications
{
  return self->_indications;
}

- (void)setIndications:(int64_t)a3
{
  self->_indications = a3;
}

- (NSString)keyMatchTrue
{
  return self->_keyMatchTrue;
}

- (void)setKeyMatchTrue:(id)a3
{
}

- (NSDictionary)keyMatchTrueMap
{
  return self->_keyMatchTrueMap;
}

- (void)setKeyMatchTrueMap:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyMatchTrueMap, 0);
  objc_storeStrong((id *)&self->_keyMatchTrue, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

@end