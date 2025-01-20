@interface WBListDefinitionTable
+ (void)readFrom:(id)a3 listDefinitionTable:(id)a4;
@end

@implementation WBListDefinitionTable

+ (void)readFrom:(id)a3 listDefinitionTable:(id)a4
{
  id v21 = a3;
  id v5 = a4;
  v6 = +[WBObjectFactory create:34];
  if (v6) {
  else
  }
    v7 = 0;
  uint64_t v8 = [v21 wrdReader];
  (*(void (**)(uint64_t, void *))(*(void *)v8 + 280))(v8, v7);
  v20 = v7 + 1;
  unint64_t v9 = v7[2] - v7[1];
  if ((int)(v9 >> 3) >= 1)
  {
    unint64_t v10 = 0;
    uint64_t v11 = (v9 >> 3);
    do
    {
      uint64_t v12 = v7[1];
      if (v10 >= ((unint64_t)(v7[2] - v12) >> 3)) {
        std::vector<TSU::UUIDData<TSP::UUIDData>>::__throw_out_of_range[abi:ne180100]();
      }
      uint64_t v13 = *(void *)(v12 + 8 * v10);
      uint64_t v14 = *(unsigned int *)(v13 + 40);
      uint64_t v15 = *(__int16 *)(v13 + 48);
      if (v15 == 12)
      {
        v16 = 0;
      }
      else
      {
        v17 = [v21 styleAtIndex:v15 expectedType:4];
        v16 = [v17 id];
      }
      v18 = objc_msgSend(v5, "addDefinitionWithDefinitionId:styleId:", v14, v16, v20);
      v19 = [v21 targetDocument];
      +[WBListDefinition readFrom:v21 listDefinition:v18 listFormat:v13 document:v19];

      ++v10;
    }
    while (v11 != v10);
  }
  (*(void (**)(void *))(*v7 + 8))(v7);
}

@end