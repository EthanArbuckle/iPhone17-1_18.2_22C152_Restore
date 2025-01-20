@interface ALSLocationResponse
+ (Class)cdmaCellTowerType;
+ (Class)cellTowerType;
+ (Class)lteCellTowerType;
+ (Class)nr5GCellTowerType;
+ (Class)scdmaCellTowerType;
+ (Class)wirelessAPType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)cdmaCellTowers;
- (NSMutableArray)cellTowers;
- (NSMutableArray)lteCellTowers;
- (NSMutableArray)nr5GCellTowers;
- (NSMutableArray)scdmaCellTowers;
- (NSMutableArray)wirelessAPs;
- (id)cdmaCellTowerAtIndex:(unint64_t)a3;
- (id)cellTowerAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)lteCellTowerAtIndex:(unint64_t)a3;
- (id)nr5GCellTowerAtIndex:(unint64_t)a3;
- (id)scdmaCellTowerAtIndex:(unint64_t)a3;
- (id)wirelessAPAtIndex:(unint64_t)a3;
- (unint64_t)cdmaCellTowersCount;
- (unint64_t)cellTowersCount;
- (unint64_t)hash;
- (unint64_t)lteCellTowersCount;
- (unint64_t)nr5GCellTowersCount;
- (unint64_t)scdmaCellTowersCount;
- (unint64_t)wirelessAPsCount;
- (void)addCdmaCellTower:(id)a3;
- (void)addCellTower:(id)a3;
- (void)addLteCellTower:(id)a3;
- (void)addNr5GCellTower:(id)a3;
- (void)addScdmaCellTower:(id)a3;
- (void)addWirelessAP:(id)a3;
- (void)clearCdmaCellTowers;
- (void)clearCellTowers;
- (void)clearLteCellTowers;
- (void)clearNr5GCellTowers;
- (void)clearScdmaCellTowers;
- (void)clearWirelessAPs;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setCdmaCellTowers:(id)a3;
- (void)setCellTowers:(id)a3;
- (void)setLteCellTowers:(id)a3;
- (void)setNr5GCellTowers:(id)a3;
- (void)setScdmaCellTowers:(id)a3;
- (void)setWirelessAPs:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ALSLocationResponse

- (void)dealloc
{
  [(ALSLocationResponse *)self setCellTowers:0];
  [(ALSLocationResponse *)self setWirelessAPs:0];
  [(ALSLocationResponse *)self setCdmaCellTowers:0];
  [(ALSLocationResponse *)self setLteCellTowers:0];
  [(ALSLocationResponse *)self setScdmaCellTowers:0];
  [(ALSLocationResponse *)self setNr5GCellTowers:0];
  v3.receiver = self;
  v3.super_class = (Class)ALSLocationResponse;
  [(ALSLocationResponse *)&v3 dealloc];
}

- (void)clearCellTowers
{
}

- (void)addCellTower:(id)a3
{
  cellTowers = self->_cellTowers;
  if (!cellTowers)
  {
    cellTowers = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    self->_cellTowers = cellTowers;
  }

  [(NSMutableArray *)cellTowers addObject:a3];
}

- (unint64_t)cellTowersCount
{
  return (unint64_t)[(NSMutableArray *)self->_cellTowers count];
}

- (id)cellTowerAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_cellTowers objectAtIndex:a3];
}

+ (Class)cellTowerType
{
  return (Class)objc_opt_class();
}

- (void)clearWirelessAPs
{
}

- (void)addWirelessAP:(id)a3
{
  wirelessAPs = self->_wirelessAPs;
  if (!wirelessAPs)
  {
    wirelessAPs = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    self->_wirelessAPs = wirelessAPs;
  }

  [(NSMutableArray *)wirelessAPs addObject:a3];
}

- (unint64_t)wirelessAPsCount
{
  return (unint64_t)[(NSMutableArray *)self->_wirelessAPs count];
}

- (id)wirelessAPAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_wirelessAPs objectAtIndex:a3];
}

+ (Class)wirelessAPType
{
  return (Class)objc_opt_class();
}

- (void)clearCdmaCellTowers
{
}

- (void)addCdmaCellTower:(id)a3
{
  cdmaCellTowers = self->_cdmaCellTowers;
  if (!cdmaCellTowers)
  {
    cdmaCellTowers = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    self->_cdmaCellTowers = cdmaCellTowers;
  }

  [(NSMutableArray *)cdmaCellTowers addObject:a3];
}

- (unint64_t)cdmaCellTowersCount
{
  return (unint64_t)[(NSMutableArray *)self->_cdmaCellTowers count];
}

- (id)cdmaCellTowerAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_cdmaCellTowers objectAtIndex:a3];
}

+ (Class)cdmaCellTowerType
{
  return (Class)objc_opt_class();
}

- (void)clearLteCellTowers
{
}

- (void)addLteCellTower:(id)a3
{
  lteCellTowers = self->_lteCellTowers;
  if (!lteCellTowers)
  {
    lteCellTowers = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    self->_lteCellTowers = lteCellTowers;
  }

  [(NSMutableArray *)lteCellTowers addObject:a3];
}

- (unint64_t)lteCellTowersCount
{
  return (unint64_t)[(NSMutableArray *)self->_lteCellTowers count];
}

- (id)lteCellTowerAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_lteCellTowers objectAtIndex:a3];
}

+ (Class)lteCellTowerType
{
  return (Class)objc_opt_class();
}

- (void)clearScdmaCellTowers
{
}

- (void)addScdmaCellTower:(id)a3
{
  scdmaCellTowers = self->_scdmaCellTowers;
  if (!scdmaCellTowers)
  {
    scdmaCellTowers = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    self->_scdmaCellTowers = scdmaCellTowers;
  }

  [(NSMutableArray *)scdmaCellTowers addObject:a3];
}

- (unint64_t)scdmaCellTowersCount
{
  return (unint64_t)[(NSMutableArray *)self->_scdmaCellTowers count];
}

- (id)scdmaCellTowerAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_scdmaCellTowers objectAtIndex:a3];
}

+ (Class)scdmaCellTowerType
{
  return (Class)objc_opt_class();
}

- (void)clearNr5GCellTowers
{
}

- (void)addNr5GCellTower:(id)a3
{
  nr5GCellTowers = self->_nr5GCellTowers;
  if (!nr5GCellTowers)
  {
    nr5GCellTowers = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    self->_nr5GCellTowers = nr5GCellTowers;
  }

  [(NSMutableArray *)nr5GCellTowers addObject:a3];
}

- (unint64_t)nr5GCellTowersCount
{
  return (unint64_t)[(NSMutableArray *)self->_nr5GCellTowers count];
}

- (id)nr5GCellTowerAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_nr5GCellTowers objectAtIndex:a3];
}

+ (Class)nr5GCellTowerType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)ALSLocationResponse;
  return +[NSString stringWithFormat:@"%@ %@", [(ALSLocationResponse *)&v3 description], [(ALSLocationResponse *)self dictionaryRepresentation]];
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  if ([(NSMutableArray *)self->_cellTowers count])
  {
    id v4 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_cellTowers, "count")];
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    cellTowers = self->_cellTowers;
    id v6 = [(NSMutableArray *)cellTowers countByEnumeratingWithState:&v61 objects:v70 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v62;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v62 != v8) {
            objc_enumerationMutation(cellTowers);
          }
          [v4 addObject:[*(id *)(*((void *)&v61 + 1) + 8 * i) dictionaryRepresentation]];
        }
        id v7 = [(NSMutableArray *)cellTowers countByEnumeratingWithState:&v61 objects:v70 count:16];
      }
      while (v7);
    }
    [v3 setObject:v4 forKey:@"cellTower"];
  }
  if ([(NSMutableArray *)self->_wirelessAPs count])
  {
    id v10 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_wirelessAPs, "count")];
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    wirelessAPs = self->_wirelessAPs;
    id v12 = [(NSMutableArray *)wirelessAPs countByEnumeratingWithState:&v57 objects:v69 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v58;
      do
      {
        for (j = 0; j != v13; j = (char *)j + 1)
        {
          if (*(void *)v58 != v14) {
            objc_enumerationMutation(wirelessAPs);
          }
          [v10 addObject:[(*(id *)(*((void *)&v57 + 1) + 8 * (void)j)) dictionaryRepresentation]];
        }
        id v13 = [(NSMutableArray *)wirelessAPs countByEnumeratingWithState:&v57 objects:v69 count:16];
      }
      while (v13);
    }
    [v3 setObject:v10 forKey:@"wirelessAP"];
  }
  if ([(NSMutableArray *)self->_cdmaCellTowers count])
  {
    id v16 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_cdmaCellTowers, "count")];
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    cdmaCellTowers = self->_cdmaCellTowers;
    id v18 = [(NSMutableArray *)cdmaCellTowers countByEnumeratingWithState:&v53 objects:v68 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v54;
      do
      {
        for (k = 0; k != v19; k = (char *)k + 1)
        {
          if (*(void *)v54 != v20) {
            objc_enumerationMutation(cdmaCellTowers);
          }
          [v16 addObject:[k dictionaryRepresentation]];
        }
        id v19 = [(NSMutableArray *)cdmaCellTowers countByEnumeratingWithState:&v53 objects:v68 count:16];
      }
      while (v19);
    }
    [v3 setObject:v16 forKey:@"cdmaCellTower"];
  }
  if ([(NSMutableArray *)self->_lteCellTowers count])
  {
    id v22 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_lteCellTowers, "count")];
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    lteCellTowers = self->_lteCellTowers;
    id v24 = [(NSMutableArray *)lteCellTowers countByEnumeratingWithState:&v49 objects:v67 count:16];
    if (v24)
    {
      id v25 = v24;
      uint64_t v26 = *(void *)v50;
      do
      {
        for (m = 0; m != v25; m = (char *)m + 1)
        {
          if (*(void *)v50 != v26) {
            objc_enumerationMutation(lteCellTowers);
          }
          [v22 addObject:[(*(id *)(*((void *)&v49 + 1) + 8 * (void)m)) dictionaryRepresentation]];
        }
        id v25 = [(NSMutableArray *)lteCellTowers countByEnumeratingWithState:&v49 objects:v67 count:16];
      }
      while (v25);
    }
    [v3 setObject:v22 forKey:@"lteCellTower"];
  }
  if ([(NSMutableArray *)self->_scdmaCellTowers count])
  {
    id v28 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_scdmaCellTowers, "count")];
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    scdmaCellTowers = self->_scdmaCellTowers;
    id v30 = [(NSMutableArray *)scdmaCellTowers countByEnumeratingWithState:&v45 objects:v66 count:16];
    if (v30)
    {
      id v31 = v30;
      uint64_t v32 = *(void *)v46;
      do
      {
        for (n = 0; n != v31; n = (char *)n + 1)
        {
          if (*(void *)v46 != v32) {
            objc_enumerationMutation(scdmaCellTowers);
          }
          [v28 addObject:[*(id *)(*((void *)&v45 + 1) + 8 * (void)n) dictionaryRepresentation]];
        }
        id v31 = [(NSMutableArray *)scdmaCellTowers countByEnumeratingWithState:&v45 objects:v66 count:16];
      }
      while (v31);
    }
    [v3 setObject:v28 forKey:@"scdmaCellTower"];
  }
  if ([(NSMutableArray *)self->_nr5GCellTowers count])
  {
    id v34 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_nr5GCellTowers, "count")];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    nr5GCellTowers = self->_nr5GCellTowers;
    id v36 = [(NSMutableArray *)nr5GCellTowers countByEnumeratingWithState:&v41 objects:v65 count:16];
    if (v36)
    {
      id v37 = v36;
      uint64_t v38 = *(void *)v42;
      do
      {
        for (ii = 0; ii != v37; ii = (char *)ii + 1)
        {
          if (*(void *)v42 != v38) {
            objc_enumerationMutation(nr5GCellTowers);
          }
          [v34 addObject:[(*(id *)(*((void *)&v41 + 1) + 8 * (void)ii)) dictionaryRepresentation]];
        }
        id v37 = [(NSMutableArray *)nr5GCellTowers countByEnumeratingWithState:&v41 objects:v65 count:16];
      }
      while (v37);
    }
    [v3 setObject:v34 forKey:@"nr5GCellTower"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100F9BCBC(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  cellTowers = self->_cellTowers;
  v5 = (char *)[(NSMutableArray *)cellTowers countByEnumeratingWithState:&v54 objects:v63 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v55;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(void *)v55 != v7) {
          objc_enumerationMutation(cellTowers);
        }
        PBDataWriterWriteSubmessage();
      }
      id v6 = (char *)[(NSMutableArray *)cellTowers countByEnumeratingWithState:&v54 objects:v63 count:16];
    }
    while (v6);
  }
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  wirelessAPs = self->_wirelessAPs;
  id v10 = (char *)[(NSMutableArray *)wirelessAPs countByEnumeratingWithState:&v50 objects:v62 count:16];
  if (v10)
  {
    v11 = v10;
    uint64_t v12 = *(void *)v51;
    do
    {
      for (j = 0; j != v11; ++j)
      {
        if (*(void *)v51 != v12) {
          objc_enumerationMutation(wirelessAPs);
        }
        PBDataWriterWriteSubmessage();
      }
      v11 = (char *)[(NSMutableArray *)wirelessAPs countByEnumeratingWithState:&v50 objects:v62 count:16];
    }
    while (v11);
  }
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  cdmaCellTowers = self->_cdmaCellTowers;
  v15 = (char *)[(NSMutableArray *)cdmaCellTowers countByEnumeratingWithState:&v46 objects:v61 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v47;
    do
    {
      for (k = 0; k != v16; ++k)
      {
        if (*(void *)v47 != v17) {
          objc_enumerationMutation(cdmaCellTowers);
        }
        PBDataWriterWriteSubmessage();
      }
      id v16 = (char *)[(NSMutableArray *)cdmaCellTowers countByEnumeratingWithState:&v46 objects:v61 count:16];
    }
    while (v16);
  }
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  lteCellTowers = self->_lteCellTowers;
  uint64_t v20 = (char *)[(NSMutableArray *)lteCellTowers countByEnumeratingWithState:&v42 objects:v60 count:16];
  if (v20)
  {
    v21 = v20;
    uint64_t v22 = *(void *)v43;
    do
    {
      for (m = 0; m != v21; ++m)
      {
        if (*(void *)v43 != v22) {
          objc_enumerationMutation(lteCellTowers);
        }
        PBDataWriterWriteSubmessage();
      }
      v21 = (char *)[(NSMutableArray *)lteCellTowers countByEnumeratingWithState:&v42 objects:v60 count:16];
    }
    while (v21);
  }
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  scdmaCellTowers = self->_scdmaCellTowers;
  id v25 = (char *)[(NSMutableArray *)scdmaCellTowers countByEnumeratingWithState:&v38 objects:v59 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v39;
    do
    {
      for (n = 0; n != v26; ++n)
      {
        if (*(void *)v39 != v27) {
          objc_enumerationMutation(scdmaCellTowers);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v26 = (char *)[(NSMutableArray *)scdmaCellTowers countByEnumeratingWithState:&v38 objects:v59 count:16];
    }
    while (v26);
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  nr5GCellTowers = self->_nr5GCellTowers;
  id v30 = (char *)[(NSMutableArray *)nr5GCellTowers countByEnumeratingWithState:&v34 objects:v58 count:16];
  if (v30)
  {
    id v31 = v30;
    uint64_t v32 = *(void *)v35;
    do
    {
      for (ii = 0; ii != v31; ++ii)
      {
        if (*(void *)v35 != v32) {
          objc_enumerationMutation(nr5GCellTowers);
        }
        PBDataWriterWriteSubmessage();
      }
      id v31 = (char *)[(NSMutableArray *)nr5GCellTowers countByEnumeratingWithState:&v34 objects:v58 count:16];
    }
    while (v31);
  }
}

- (void)copyTo:(id)a3
{
  if ([(ALSLocationResponse *)self cellTowersCount])
  {
    [a3 clearCellTowers];
    unint64_t v5 = [(ALSLocationResponse *)self cellTowersCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
        [a3 addCellTower:-[ALSLocationResponse cellTowerAtIndex:](self, "cellTowerAtIndex:", i)];
    }
  }
  if ([(ALSLocationResponse *)self wirelessAPsCount])
  {
    [a3 clearWirelessAPs];
    unint64_t v8 = [(ALSLocationResponse *)self wirelessAPsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
        [a3 addWirelessAP:-[ALSLocationResponse wirelessAPAtIndex:](self, "wirelessAPAtIndex:", j)];
    }
  }
  if ([(ALSLocationResponse *)self cdmaCellTowersCount])
  {
    [a3 clearCdmaCellTowers];
    unint64_t v11 = [(ALSLocationResponse *)self cdmaCellTowersCount];
    if (v11)
    {
      unint64_t v12 = v11;
      for (uint64_t k = 0; k != v12; ++k)
        [a3 addCdmaCellTower:-[ALSLocationResponse cdmaCellTowerAtIndex:](self, "cdmaCellTowerAtIndex:", k)];
    }
  }
  if ([(ALSLocationResponse *)self lteCellTowersCount])
  {
    [a3 clearLteCellTowers];
    unint64_t v14 = [(ALSLocationResponse *)self lteCellTowersCount];
    if (v14)
    {
      unint64_t v15 = v14;
      for (uint64_t m = 0; m != v15; ++m)
        [a3 addLteCellTower:-[ALSLocationResponse lteCellTowerAtIndex:](self, "lteCellTowerAtIndex:", m)];
    }
  }
  if ([(ALSLocationResponse *)self scdmaCellTowersCount])
  {
    [a3 clearScdmaCellTowers];
    unint64_t v17 = [(ALSLocationResponse *)self scdmaCellTowersCount];
    if (v17)
    {
      unint64_t v18 = v17;
      for (uint64_t n = 0; n != v18; ++n)
        [a3 addScdmaCellTower:-[ALSLocationResponse scdmaCellTowerAtIndex:](self, "scdmaCellTowerAtIndex:", n)];
    }
  }
  if ([(ALSLocationResponse *)self nr5GCellTowersCount])
  {
    [a3 clearNr5GCellTowers];
    unint64_t v20 = [(ALSLocationResponse *)self nr5GCellTowersCount];
    if (v20)
    {
      unint64_t v21 = v20;
      for (iuint64_t i = 0; ii != v21; ++ii)
        [a3 addNr5GCellTower:-[ALSLocationResponse nr5GCellTowerAtIndex:](self, "nr5GCellTowerAtIndex:", ii)];
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[objc_opt_class() allocWithZone:a3] init];
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  cellTowers = self->_cellTowers;
  id v7 = [(NSMutableArray *)cellTowers countByEnumeratingWithState:&v63 objects:v72 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v64;
    do
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v64 != v9) {
          objc_enumerationMutation(cellTowers);
        }
        id v11 = [*(id *)(*((void *)&v63 + 1) + 8 * i) copyWithZone:a3];
        [v5 addCellTower:v11];
      }
      id v8 = [(NSMutableArray *)cellTowers countByEnumeratingWithState:&v63 objects:v72 count:16];
    }
    while (v8);
  }
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  wirelessAPs = self->_wirelessAPs;
  id v13 = [(NSMutableArray *)wirelessAPs countByEnumeratingWithState:&v59 objects:v71 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v60;
    do
    {
      for (uint64_t j = 0; j != v14; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v60 != v15) {
          objc_enumerationMutation(wirelessAPs);
        }
        id v17 = [*(id *)(*((void *)&v59 + 1) + 8 * (void)j) copyWithZone:a3];
        [v5 addWirelessAP:v17];
      }
      id v14 = [(NSMutableArray *)wirelessAPs countByEnumeratingWithState:&v59 objects:v71 count:16];
    }
    while (v14);
  }
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  cdmaCellTowers = self->_cdmaCellTowers;
  id v19 = [(NSMutableArray *)cdmaCellTowers countByEnumeratingWithState:&v55 objects:v70 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v56;
    do
    {
      for (uint64_t k = 0; k != v20; uint64_t k = (char *)k + 1)
      {
        if (*(void *)v56 != v21) {
          objc_enumerationMutation(cdmaCellTowers);
        }
        id v23 = [*(id *)(*((void *)&v55 + 1) + 8 * (void)k) copyWithZone:a3];
        [v5 addCdmaCellTower:v23];
      }
      id v20 = [(NSMutableArray *)cdmaCellTowers countByEnumeratingWithState:&v55 objects:v70 count:16];
    }
    while (v20);
  }
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  lteCellTowers = self->_lteCellTowers;
  id v25 = [(NSMutableArray *)lteCellTowers countByEnumeratingWithState:&v51 objects:v69 count:16];
  if (v25)
  {
    id v26 = v25;
    uint64_t v27 = *(void *)v52;
    do
    {
      for (uint64_t m = 0; m != v26; uint64_t m = (char *)m + 1)
      {
        if (*(void *)v52 != v27) {
          objc_enumerationMutation(lteCellTowers);
        }
        id v29 = [*(id *)(*((void *)&v51 + 1) + 8 * (void)m) copyWithZone:a3];
        [v5 addLteCellTower:v29];
      }
      id v26 = [(NSMutableArray *)lteCellTowers countByEnumeratingWithState:&v51 objects:v69 count:16];
    }
    while (v26);
  }
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  scdmaCellTowers = self->_scdmaCellTowers;
  id v31 = [(NSMutableArray *)scdmaCellTowers countByEnumeratingWithState:&v47 objects:v68 count:16];
  if (v31)
  {
    id v32 = v31;
    uint64_t v33 = *(void *)v48;
    do
    {
      for (uint64_t n = 0; n != v32; uint64_t n = (char *)n + 1)
      {
        if (*(void *)v48 != v33) {
          objc_enumerationMutation(scdmaCellTowers);
        }
        id v35 = [*(id *)(*((void *)&v47 + 1) + 8 * (void)n) copyWithZone:a3];
        [v5 addScdmaCellTower:v35];
      }
      id v32 = [(NSMutableArray *)scdmaCellTowers countByEnumeratingWithState:&v47 objects:v68 count:16];
    }
    while (v32);
  }
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  nr5GCellTowers = self->_nr5GCellTowers;
  id v37 = [(NSMutableArray *)nr5GCellTowers countByEnumeratingWithState:&v43 objects:v67 count:16];
  if (v37)
  {
    id v38 = v37;
    uint64_t v39 = *(void *)v44;
    do
    {
      for (iuint64_t i = 0; ii != v38; iuint64_t i = (char *)ii + 1)
      {
        if (*(void *)v44 != v39) {
          objc_enumerationMutation(nr5GCellTowers);
        }
        id v41 = [*(id *)(*((void *)&v43 + 1) + 8 * (void)ii) copyWithZone:a3];
        [v5 addNr5GCellTower:v41];
      }
      id v38 = [(NSMutableArray *)nr5GCellTowers countByEnumeratingWithState:&v43 objects:v67 count:16];
    }
    while (v38);
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    cellTowers = self->_cellTowers;
    if (!((unint64_t)cellTowers | *((void *)a3 + 2))
      || (unsigned int v5 = -[NSMutableArray isEqual:](cellTowers, "isEqual:")) != 0)
    {
      wirelessAPs = self->_wirelessAPs;
      if (!((unint64_t)wirelessAPs | *((void *)a3 + 6))
        || (unsigned int v5 = -[NSMutableArray isEqual:](wirelessAPs, "isEqual:")) != 0)
      {
        cdmaCellTowers = self->_cdmaCellTowers;
        if (!((unint64_t)cdmaCellTowers | *((void *)a3 + 1))
          || (unsigned int v5 = -[NSMutableArray isEqual:](cdmaCellTowers, "isEqual:")) != 0)
        {
          lteCellTowers = self->_lteCellTowers;
          if (!((unint64_t)lteCellTowers | *((void *)a3 + 3))
            || (unsigned int v5 = -[NSMutableArray isEqual:](lteCellTowers, "isEqual:")) != 0)
          {
            scdmaCellTowers = self->_scdmaCellTowers;
            if (!((unint64_t)scdmaCellTowers | *((void *)a3 + 5))
              || (unsigned int v5 = -[NSMutableArray isEqual:](scdmaCellTowers, "isEqual:")) != 0)
            {
              nr5GCellTowers = self->_nr5GCellTowers;
              if ((unint64_t)nr5GCellTowers | *((void *)a3 + 4))
              {
                LOBYTE(v5) = -[NSMutableArray isEqual:](nr5GCellTowers, "isEqual:");
              }
              else
              {
                LOBYTE(v5) = 1;
              }
            }
          }
        }
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3 = (unint64_t)[(NSMutableArray *)self->_cellTowers hash];
  unint64_t v4 = (unint64_t)[(NSMutableArray *)self->_wirelessAPs hash] ^ v3;
  unint64_t v5 = (unint64_t)[(NSMutableArray *)self->_cdmaCellTowers hash];
  unint64_t v6 = v4 ^ v5 ^ (unint64_t)[(NSMutableArray *)self->_lteCellTowers hash];
  unint64_t v7 = (unint64_t)[(NSMutableArray *)self->_scdmaCellTowers hash];
  return v6 ^ v7 ^ (unint64_t)[(NSMutableArray *)self->_nr5GCellTowers hash];
}

- (void)mergeFrom:(id)a3
{
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  unint64_t v5 = (void *)*((void *)a3 + 2);
  id v6 = [v5 countByEnumeratingWithState:&v55 objects:v64 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v56;
    do
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v56 != v8) {
          objc_enumerationMutation(v5);
        }
        [(ALSLocationResponse *)self addCellTower:*(void *)(*((void *)&v55 + 1) + 8 * i)];
      }
      id v7 = [v5 countByEnumeratingWithState:&v55 objects:v64 count:16];
    }
    while (v7);
  }
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v10 = (void *)*((void *)a3 + 6);
  id v11 = [v10 countByEnumeratingWithState:&v51 objects:v63 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v52;
    do
    {
      for (uint64_t j = 0; j != v12; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v52 != v13) {
          objc_enumerationMutation(v10);
        }
        [(ALSLocationResponse *)self addWirelessAP:*(void *)(*((void *)&v51 + 1) + 8 * (void)j)];
      }
      id v12 = [v10 countByEnumeratingWithState:&v51 objects:v63 count:16];
    }
    while (v12);
  }
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  uint64_t v15 = (void *)*((void *)a3 + 1);
  id v16 = [v15 countByEnumeratingWithState:&v47 objects:v62 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v48;
    do
    {
      for (uint64_t k = 0; k != v17; uint64_t k = (char *)k + 1)
      {
        if (*(void *)v48 != v18) {
          objc_enumerationMutation(v15);
        }
        [(ALSLocationResponse *)self addCdmaCellTower:*(void *)(*((void *)&v47 + 1) + 8 * (void)k)];
      }
      id v17 = [v15 countByEnumeratingWithState:&v47 objects:v62 count:16];
    }
    while (v17);
  }
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v20 = (void *)*((void *)a3 + 3);
  id v21 = [v20 countByEnumeratingWithState:&v43 objects:v61 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v44;
    do
    {
      for (uint64_t m = 0; m != v22; uint64_t m = (char *)m + 1)
      {
        if (*(void *)v44 != v23) {
          objc_enumerationMutation(v20);
        }
        [(ALSLocationResponse *)self addLteCellTower:*(void *)(*((void *)&v43 + 1) + 8 * (void)m)];
      }
      id v22 = [v20 countByEnumeratingWithState:&v43 objects:v61 count:16];
    }
    while (v22);
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v25 = (void *)*((void *)a3 + 5);
  id v26 = [v25 countByEnumeratingWithState:&v39 objects:v60 count:16];
  if (v26)
  {
    id v27 = v26;
    uint64_t v28 = *(void *)v40;
    do
    {
      for (uint64_t n = 0; n != v27; uint64_t n = (char *)n + 1)
      {
        if (*(void *)v40 != v28) {
          objc_enumerationMutation(v25);
        }
        [(ALSLocationResponse *)self addScdmaCellTower:*(void *)(*((void *)&v39 + 1) + 8 * (void)n)];
      }
      id v27 = [v25 countByEnumeratingWithState:&v39 objects:v60 count:16];
    }
    while (v27);
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v30 = (void *)*((void *)a3 + 4);
  id v31 = [v30 countByEnumeratingWithState:&v35 objects:v59 count:16];
  if (v31)
  {
    id v32 = v31;
    uint64_t v33 = *(void *)v36;
    do
    {
      for (iuint64_t i = 0; ii != v32; iuint64_t i = (char *)ii + 1)
      {
        if (*(void *)v36 != v33) {
          objc_enumerationMutation(v30);
        }
        [(ALSLocationResponse *)self addNr5GCellTower:*(void *)(*((void *)&v35 + 1) + 8 * (void)ii)];
      }
      id v32 = [v30 countByEnumeratingWithState:&v35 objects:v59 count:16];
    }
    while (v32);
  }
}

- (NSMutableArray)cellTowers
{
  return self->_cellTowers;
}

- (void)setCellTowers:(id)a3
{
}

- (NSMutableArray)wirelessAPs
{
  return self->_wirelessAPs;
}

- (void)setWirelessAPs:(id)a3
{
}

- (NSMutableArray)cdmaCellTowers
{
  return self->_cdmaCellTowers;
}

- (void)setCdmaCellTowers:(id)a3
{
}

- (NSMutableArray)lteCellTowers
{
  return self->_lteCellTowers;
}

- (void)setLteCellTowers:(id)a3
{
}

- (NSMutableArray)scdmaCellTowers
{
  return self->_scdmaCellTowers;
}

- (void)setScdmaCellTowers:(id)a3
{
}

- (NSMutableArray)nr5GCellTowers
{
  return self->_nr5GCellTowers;
}

- (void)setNr5GCellTowers:(id)a3
{
}

@end