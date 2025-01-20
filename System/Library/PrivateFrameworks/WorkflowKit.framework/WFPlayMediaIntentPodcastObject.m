@interface WFPlayMediaIntentPodcastObject
+ (BOOL)supportsSecureCoding;
+ (id)intentJSONTransformer;
- (BOOL)isEqual:(id)a3;
- (INPlayMediaIntent)intent;
- (WFPlayMediaIntentPodcastObject)initWithIntent:(id)a3;
- (unint64_t)hash;
@end

@implementation WFPlayMediaIntentPodcastObject

- (void).cxx_destruct
{
}

- (INPlayMediaIntent)intent
{
  return self->_intent;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)WFPlayMediaIntentPodcastObject;
  unint64_t v3 = [(MTLModel *)&v7 hash];
  v4 = [(WFPlayMediaIntentPodcastObject *)self intent];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WFPlayMediaIntentPodcastObject;
  if ([(MTLModel *)&v13 isEqual:v4])
  {
    id v5 = v4;
    v6 = [(WFPlayMediaIntentPodcastObject *)self intent];
    objc_super v7 = [v5 intent];
    id v8 = v6;
    id v9 = v7;
    v10 = v9;
    if (v8 == v9)
    {
      char v11 = 1;
    }
    else
    {
      char v11 = 0;
      if (v8 && v9) {
        char v11 = [v8 isEqual:v9];
      }
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (WFPlayMediaIntentPodcastObject)initWithIntent:(id)a3
{
  id v5 = a3;
  v6 = [v5 mediaItems];
  uint64_t v7 = [v6 firstObject];
  if (v7)
  {
    id v8 = (void *)v7;
  }
  else
  {
    id v8 = [v5 mediaContainer];

    if (!v8)
    {
      v19 = 0;
      goto LABEL_11;
    }
  }
  id v9 = (void *)MEMORY[0x1E4F29088];
  v10 = [v8 identifier];
  char v11 = [v9 componentsWithString:v10];

  v12 = [v11 queryItems];
  objc_super v13 = [v12 objectMatchingKey:@"name" value:@"storeCollectionId"];

  v14 = [v5 mediaContainer];
  v15 = [v14 title];
  v16 = v15;
  if (!v15)
  {
    v16 = [v8 title];
  }
  v17 = [v13 value];
  v21.receiver = self;
  v21.super_class = (Class)WFPlayMediaIntentPodcastObject;
  self = [(WFiTunesPodcastObject *)&v21 initWithName:v16 identifier:v17 podcastUUID:0 feedURL:0 kind:@"podcast"];

  if (!v15) {
  if (self)
  }
  {
    objc_storeStrong((id *)&self->_intent, a3);
    v18 = self;
  }

  v19 = self;
LABEL_11:

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)intentJSONTransformer
{
  return +[MTLValueTransformer transformerUsingForwardBlock:&__block_literal_global_825 reverseBlock:&__block_literal_global_830];
}

id __55__WFPlayMediaIntentPodcastObject_intentJSONTransformer__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4F28D90];
  unint64_t v3 = [a2 _JSONDictionaryRepresentation];
  id v4 = [v2 dataWithJSONObject:v3 options:0 error:0];

  return v4;
}

id __55__WFPlayMediaIntentPodcastObject_intentJSONTransformer__block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a2 options:0 error:0];
  id v3 = objc_alloc_init(MEMORY[0x1E4F305C8]);
  [v3 _updateWithJSONDictionary:v2];

  return v3;
}

@end