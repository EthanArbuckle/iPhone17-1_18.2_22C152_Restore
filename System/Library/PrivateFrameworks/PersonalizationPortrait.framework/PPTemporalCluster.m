@interface PPTemporalCluster
+ (BOOL)supportsSecureCoding;
- (NSArray)contactHandles;
- (NSArray)contacts;
- (NSArray)entities;
- (NSArray)locations;
- (NSArray)mediaItems;
- (NSArray)topics;
- (NSDate)endDate;
- (NSDate)startDate;
- (PPEvent)event;
- (PPTemporalCluster)initWithCoder:(id)a3;
- (PPTemporalCluster)initWithEvent:(id)a3 startDate:(id)a4 endDate:(id)a5 score:(double)a6 topics:(id)a7 entities:(id)a8 locations:(id)a9 contacts:(id)a10 contactHandles:(id)a11 mediaItems:(id)a12;
- (double)score;
- (id)description;
- (id)descriptionDateFormatter;
- (id)longDescription;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PPTemporalCluster

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaItems, 0);
  objc_storeStrong((id *)&self->_contactHandles, 0);
  objc_storeStrong((id *)&self->_contacts, 0);
  objc_storeStrong((id *)&self->_locations, 0);
  objc_storeStrong((id *)&self->_entities, 0);
  objc_storeStrong((id *)&self->_topics, 0);
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

- (NSArray)mediaItems
{
  return self->_mediaItems;
}

- (NSArray)contactHandles
{
  return self->_contactHandles;
}

- (NSArray)contacts
{
  return self->_contacts;
}

- (NSArray)locations
{
  return self->_locations;
}

- (NSArray)entities
{
  return self->_entities;
}

- (NSArray)topics
{
  return self->_topics;
}

- (PPEvent)event
{
  return self->_event;
}

- (double)score
{
  return self->_score;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (PPTemporalCluster)initWithCoder:(id)a3
{
  id v3 = a3;
  v4 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v5 = objc_opt_class();
  v6 = pp_temporal_clusters_log_handle();
  v76 = [v4 robustDecodeObjectOfClass:v5 forKey:@"st" withCoder:v3 expectNonNull:1 errorDomain:@"PPErrorDomain" errorCode:23 logHandle:v6];

  v7 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v8 = objc_opt_class();
  v9 = pp_temporal_clusters_log_handle();
  uint64_t v69 = [v7 robustDecodeObjectOfClass:v8 forKey:@"ed" withCoder:v3 expectNonNull:1 errorDomain:@"PPErrorDomain" errorCode:23 logHandle:v9];

  v10 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v11 = objc_opt_class();
  v12 = pp_temporal_clusters_log_handle();
  v73 = [v10 robustDecodeObjectOfClass:v11 forKey:@"sc" withCoder:v3 expectNonNull:1 errorDomain:@"PPErrorDomain" errorCode:23 logHandle:v12];

  v13 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v14 = objc_opt_class();
  v15 = pp_temporal_clusters_log_handle();
  uint64_t v72 = [v13 robustDecodeObjectOfClass:v14 forKey:@"sd" withCoder:v3 expectNonNull:0 errorDomain:@"PPErrorDomain" errorCode:23 logHandle:v15];

  v16 = (void *)MEMORY[0x1E4F93B90];
  v17 = (void *)MEMORY[0x192F97350]();
  id v18 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v19 = objc_opt_class();
  v20 = objc_msgSend(v18, "initWithObjects:", v19, objc_opt_class(), 0);
  v21 = pp_temporal_clusters_log_handle();
  uint64_t v75 = [v16 robustDecodeObjectOfClasses:v20 forKey:@"tp" withCoder:v3 expectNonNull:1 errorDomain:@"PPErrorDomain" errorCode:23 logHandle:v21];

  v22 = (void *)MEMORY[0x1E4F93B90];
  v23 = (void *)MEMORY[0x192F97350]();
  id v24 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v25 = objc_opt_class();
  v26 = objc_msgSend(v24, "initWithObjects:", v25, objc_opt_class(), 0);
  v27 = pp_temporal_clusters_log_handle();
  uint64_t v74 = [v22 robustDecodeObjectOfClasses:v26 forKey:@"ne" withCoder:v3 expectNonNull:1 errorDomain:@"PPErrorDomain" errorCode:23 logHandle:v27];

  v28 = (void *)MEMORY[0x1E4F93B90];
  v29 = (void *)MEMORY[0x192F97350]();
  id v30 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v31 = objc_opt_class();
  v32 = objc_msgSend(v30, "initWithObjects:", v31, objc_opt_class(), 0);
  v33 = pp_temporal_clusters_log_handle();
  v34 = [v28 robustDecodeObjectOfClasses:v32 forKey:@"lc" withCoder:v3 expectNonNull:1 errorDomain:@"PPErrorDomain" errorCode:23 logHandle:v33];

  v35 = (void *)MEMORY[0x1E4F93B90];
  v36 = (void *)MEMORY[0x192F97350]();
  id v37 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v38 = objc_opt_class();
  v39 = objc_msgSend(v37, "initWithObjects:", v38, objc_opt_class(), 0);
  v40 = pp_temporal_clusters_log_handle();
  uint64_t v68 = [v35 robustDecodeObjectOfClasses:v39 forKey:@"ct" withCoder:v3 expectNonNull:1 errorDomain:@"PPErrorDomain" errorCode:23 logHandle:v40];

  v41 = (void *)MEMORY[0x1E4F93B90];
  v42 = (void *)MEMORY[0x192F97350]();
  id v43 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v44 = objc_opt_class();
  v45 = objc_msgSend(v43, "initWithObjects:", v44, objc_opt_class(), 0);
  v46 = pp_temporal_clusters_log_handle();
  uint64_t v67 = [v41 robustDecodeObjectOfClasses:v45 forKey:@"ch" withCoder:v3 expectNonNull:1 errorDomain:@"PPErrorDomain" errorCode:23 logHandle:v46];

  v47 = (void *)MEMORY[0x1E4F93B90];
  v48 = (void *)MEMORY[0x192F97350]();
  id v49 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v50 = objc_opt_class();
  v51 = objc_msgSend(v49, "initWithObjects:", v50, objc_opt_class(), 0);
  v52 = pp_temporal_clusters_log_handle();
  v71 = v3;
  uint64_t v53 = [v47 robustDecodeObjectOfClasses:v51 forKey:@"mi" withCoder:v3 expectNonNull:1 errorDomain:@"PPErrorDomain" errorCode:23 logHandle:v52];

  v54 = 0;
  if (!v76)
  {
    v63 = (void *)v53;
    v55 = (void *)v69;
    v64 = self;
    v56 = v73;
LABEL_22:
    v61 = (void *)v72;
    v57 = (void *)v75;
    goto LABEL_23;
  }
  v55 = (void *)v69;
  if (!v69)
  {
    v56 = v73;
    goto LABEL_21;
  }
  v56 = v73;
  if (!v73)
  {
LABEL_21:
    v63 = (void *)v53;
    v64 = self;
    goto LABEL_22;
  }
  v57 = (void *)v75;
  if (!v75)
  {
    v63 = (void *)v53;
    v64 = self;
    v61 = (void *)v72;
LABEL_23:
    v58 = (void *)v74;
    goto LABEL_24;
  }
  v58 = (void *)v74;
  if (!v74 || !v34)
  {
    v63 = (void *)v53;
    v64 = self;
    v61 = (void *)v72;
LABEL_24:
    v60 = (void *)v67;
    v59 = (void *)v68;
    goto LABEL_25;
  }
  v59 = (void *)v68;
  if (!v68)
  {
    v63 = (void *)v53;
    v64 = self;
    v61 = (void *)v72;
    v60 = (void *)v67;
    goto LABEL_25;
  }
  v60 = (void *)v67;
  if (!v67)
  {
    v63 = (void *)v53;
    v64 = self;
    v61 = (void *)v72;
    goto LABEL_25;
  }
  if (!v53) {
    goto LABEL_14;
  }
  if (!v72)
  {
    v65 = [v71 error];

    if (v65)
    {
      v54 = 0;
      v55 = (void *)v69;
      v56 = v73;
LABEL_14:
      v63 = (void *)v53;
      v64 = self;
      v61 = (void *)v72;
      v58 = (void *)v74;
      v57 = (void *)v75;
      goto LABEL_25;
    }
  }
  [v73 doubleValue];
  v61 = (void *)v72;
  v55 = (void *)v69;
  v56 = v73;
  v58 = (void *)v74;
  v57 = (void *)v75;
  v62 = -[PPTemporalCluster initWithEvent:startDate:endDate:score:topics:entities:locations:contacts:contactHandles:mediaItems:](self, "initWithEvent:startDate:endDate:score:topics:entities:locations:contacts:contactHandles:mediaItems:", v72, v76, v69, v75, v74, v34, v68, v67, v53);
  v63 = (void *)v53;
  v64 = v62;
  v54 = v62;
LABEL_25:

  return v54;
}

- (void)encodeWithCoder:(id)a3
{
  startDate = self->_startDate;
  id v6 = a3;
  [v6 encodeObject:startDate forKey:@"st"];
  [v6 encodeObject:self->_endDate forKey:@"ed"];
  uint64_t v5 = [NSNumber numberWithDouble:self->_score];
  [v6 encodeObject:v5 forKey:@"sc"];

  [v6 encodeObject:self->_event forKey:@"sd"];
  [v6 encodeObject:self->_topics forKey:@"tp"];
  [v6 encodeObject:self->_entities forKey:@"ne"];
  [v6 encodeObject:self->_locations forKey:@"lc"];
  [v6 encodeObject:self->_contacts forKey:@"ct"];
  [v6 encodeObject:self->_contactHandles forKey:@"ch"];
  [v6 encodeObject:self->_mediaItems forKey:@"mi"];
}

- (id)descriptionDateFormatter
{
  v2 = objc_opt_new();
  [v2 setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
  return v2;
}

- (id)longDescription
{
  uint64_t v111 = *MEMORY[0x1E4F143B8];
  id v3 = [(PPTemporalCluster *)self descriptionDateFormatter];
  v4 = objc_opt_new();
  objc_msgSend(v4, "appendFormat:", @"=> PPTemporalCluster (%p) <=", self);
  uint64_t v5 = [(PPTemporalCluster *)self startDate];
  id v6 = [v3 stringFromDate:v5];
  [v4 appendFormat:@"\nStart date: %@", v6];

  v7 = [(PPTemporalCluster *)self endDate];
  v77 = v3;
  uint64_t v8 = [v3 stringFromDate:v7];
  [v4 appendFormat:@"\nEnd date: %@", v8];

  v9 = [(PPTemporalCluster *)self event];
  v10 = [v9 title];
  [v4 appendFormat:@"\nEvent: %@", v10];

  uint64_t v11 = [(PPTemporalCluster *)self event];
  if ([v11 suggestedEventCategory])
  {
    v12 = [(PPTemporalCluster *)self event];
    int v13 = [v12 suggestedEventCategory];

    if (!v13) {
      goto LABEL_5;
    }
    uint64_t v11 = [(PPTemporalCluster *)self event];
    uint64_t v14 = +[PPEvent descriptionForSuggestedEventCategory:](PPEvent, "descriptionForSuggestedEventCategory:", [v11 suggestedEventCategory]);
    [v4 appendFormat:@" - (Suggested event, category: %@)", v14];
  }
LABEL_5:
  v15 = [(PPTemporalCluster *)self topics];
  objc_msgSend(v4, "appendFormat:", @"\n %tu Topics:", objc_msgSend(v15, "count"));

  long long v103 = 0u;
  long long v104 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  v78 = self;
  v16 = [(PPTemporalCluster *)self topics];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v101 objects:v110 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v102;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v102 != v19) {
          objc_enumerationMutation(v16);
        }
        v21 = *(void **)(*((void *)&v101 + 1) + 8 * i);
        v22 = [v21 item];
        v23 = [v22 topicIdentifier];
        [v21 score];
        [v4 appendFormat:@"\n\t: %@ (score: %f)", v23, v24];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v101 objects:v110 count:16];
    }
    while (v18);
  }

  uint64_t v25 = [(PPTemporalCluster *)self entities];
  objc_msgSend(v4, "appendFormat:", @"\n %tu Entities:", objc_msgSend(v25, "count"));

  long long v99 = 0u;
  long long v100 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  v26 = [(PPTemporalCluster *)self entities];
  uint64_t v27 = [v26 countByEnumeratingWithState:&v97 objects:v109 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v98;
    do
    {
      for (uint64_t j = 0; j != v28; ++j)
      {
        if (*(void *)v98 != v29) {
          objc_enumerationMutation(v26);
        }
        uint64_t v31 = *(void **)(*((void *)&v97 + 1) + 8 * j);
        v32 = [v31 item];
        v33 = [v32 name];
        [v31 score];
        [v4 appendFormat:@"\n\t: %@ (score: %f)", v33, v34];
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v97 objects:v109 count:16];
    }
    while (v28);
  }

  v35 = [(PPTemporalCluster *)self locations];
  objc_msgSend(v4, "appendFormat:", @"\n %tu Locations:", objc_msgSend(v35, "count"));

  long long v95 = 0u;
  long long v96 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  v36 = [(PPTemporalCluster *)self locations];
  uint64_t v37 = [v36 countByEnumeratingWithState:&v93 objects:v108 count:16];
  if (v37)
  {
    uint64_t v38 = v37;
    id v39 = *(id *)v94;
    obuint64_t j = *(id *)v94;
    do
    {
      for (uint64_t k = 0; k != v38; ++k)
      {
        if (*(id *)v94 != v39) {
          objc_enumerationMutation(v36);
        }
        v41 = *(void **)(*((void *)&v93 + 1) + 8 * k);
        v42 = [v41 location];
        id v43 = [v42 placemark];

        uint64_t v44 = [v43 name];
        if (v44)
        {
          v45 = [v43 name];
        }
        else
        {
          v46 = [v43 thoroughfare];
          if (v46)
          {
            v45 = [v43 thoroughfare];
          }
          else
          {
            v47 = v36;
            v48 = [v43 locality];
            if (v48)
            {
              v45 = [v43 locality];
            }
            else
            {
              v45 = &stru_1EDA56F70;
            }

            v36 = v47;
            id v39 = obj;
          }
        }
        [v41 score];
        [v4 appendFormat:@"\n\t: %@ (score: %f)", v45, v49];
      }
      uint64_t v38 = [v36 countByEnumeratingWithState:&v93 objects:v108 count:16];
    }
    while (v38);
  }

  uint64_t v50 = [(PPTemporalCluster *)v78 contacts];
  objc_msgSend(v4, "appendFormat:", @"\n %tu Contacts:", objc_msgSend(v50, "count"));

  long long v91 = 0u;
  long long v92 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  id obja = [(PPTemporalCluster *)v78 contacts];
  uint64_t v51 = [obja countByEnumeratingWithState:&v89 objects:v107 count:16];
  if (v51)
  {
    uint64_t v52 = v51;
    uint64_t v53 = *(void *)v90;
    do
    {
      for (uint64_t m = 0; m != v52; ++m)
      {
        if (*(void *)v90 != v53) {
          objc_enumerationMutation(obja);
        }
        v55 = *(void **)(*((void *)&v89 + 1) + 8 * m);
        v56 = [v55 contact];
        v57 = [v56 givenName];
        v58 = [v55 contact];
        v59 = [v58 familyName];
        [v55 score];
        [v4 appendFormat:@"\n\t: %@ %@ (score: %f)", v57, v59, v60];
      }
      uint64_t v52 = [obja countByEnumeratingWithState:&v89 objects:v107 count:16];
    }
    while (v52);
  }

  v61 = [(PPTemporalCluster *)v78 contactHandles];
  objc_msgSend(v4, "appendFormat:", @"\n %tu ContactHandles:", objc_msgSend(v61, "count"));

  long long v87 = 0u;
  long long v88 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  v62 = [(PPTemporalCluster *)v78 contactHandles];
  uint64_t v63 = [v62 countByEnumeratingWithState:&v85 objects:v106 count:16];
  if (v63)
  {
    uint64_t v64 = v63;
    uint64_t v65 = *(void *)v86;
    do
    {
      for (uint64_t n = 0; n != v64; ++n)
      {
        if (*(void *)v86 != v65) {
          objc_enumerationMutation(v62);
        }
        uint64_t v67 = *(void **)(*((void *)&v85 + 1) + 8 * n);
        uint64_t v68 = [v67 contactHandle];
        [v67 score];
        [v4 appendFormat:@"\n\t: %@ (score: %f)", v68, v69];
      }
      uint64_t v64 = [v62 countByEnumeratingWithState:&v85 objects:v106 count:16];
    }
    while (v64);
  }

  v70 = [(PPTemporalCluster *)v78 mediaItems];
  objc_msgSend(v4, "appendFormat:", @"\n %tu Related Media Items:", objc_msgSend(v70, "count"));

  long long v83 = 0u;
  long long v84 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  v71 = [(PPTemporalCluster *)v78 mediaItems];
  uint64_t v72 = [v71 countByEnumeratingWithState:&v81 objects:v105 count:16];
  if (v72)
  {
    uint64_t v73 = v72;
    uint64_t v74 = *(void *)v82;
    do
    {
      for (iuint64_t i = 0; ii != v73; ++ii)
      {
        if (*(void *)v82 != v74) {
          objc_enumerationMutation(v71);
        }
        [v4 appendFormat:@"\n\t: %@", *(void *)(*((void *)&v81 + 1) + 8 * ii)];
      }
      uint64_t v73 = [v71 countByEnumeratingWithState:&v81 objects:v105 count:16];
    }
    while (v73);
  }

  [v4 appendString:@"\n\n"];
  return v4;
}

- (id)description
{
  uint64_t v24 = [(PPTemporalCluster *)self descriptionDateFormatter];
  id v21 = [NSString alloc];
  uint64_t v25 = [(PPTemporalCluster *)self startDate];
  v20 = [v24 stringFromDate:v25];
  v23 = [(PPTemporalCluster *)self endDate];
  uint64_t v19 = [v24 stringFromDate:v23];
  [(PPTemporalCluster *)self score];
  uint64_t v4 = v3;
  v22 = [(PPTemporalCluster *)self event];
  uint64_t v18 = [v22 title];
  uint64_t v5 = [(PPTemporalCluster *)self topics];
  uint64_t v17 = [v5 count];
  id v6 = [(PPTemporalCluster *)self entities];
  uint64_t v7 = [v6 count];
  uint64_t v8 = [(PPTemporalCluster *)self locations];
  uint64_t v9 = [v8 count];
  v10 = [(PPTemporalCluster *)self contacts];
  uint64_t v11 = [v10 count];
  v12 = [(PPTemporalCluster *)self contactHandles];
  uint64_t v13 = [v12 count];
  uint64_t v14 = [(PPTemporalCluster *)self mediaItems];
  v15 = (void *)[v21 initWithFormat:@"<PPTemporalCluster st:%@ ed:%@ sc:%f et:'%@' tp:%tu ne:%tu lc:%tu ct:%tu ch:%tu mi:%tu>", v20, v19, v4, v18, v17, v7, v9, v11, v13, objc_msgSend(v14, "count")];

  return v15;
}

- (PPTemporalCluster)initWithEvent:(id)a3 startDate:(id)a4 endDate:(id)a5 score:(double)a6 topics:(id)a7 entities:(id)a8 locations:(id)a9 contacts:(id)a10 contactHandles:(id)a11 mediaItems:(id)a12
{
  id v31 = a3;
  id v30 = a4;
  id v29 = a5;
  id v28 = a7;
  id v27 = a8;
  id v26 = a9;
  id v25 = a10;
  id v24 = a11;
  id v20 = a12;
  v32.receiver = self;
  v32.super_class = (Class)PPTemporalCluster;
  id v21 = [(PPTemporalCluster *)&v32 init];
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_event, a3);
    objc_storeStrong((id *)&v22->_startDate, a4);
    objc_storeStrong((id *)&v22->_endDate, a5);
    v22->_score = a6;
    objc_storeStrong((id *)&v22->_topics, a7);
    objc_storeStrong((id *)&v22->_entities, a8);
    objc_storeStrong((id *)&v22->_locations, a9);
    objc_storeStrong((id *)&v22->_contacts, a10);
    objc_storeStrong((id *)&v22->_contactHandles, a11);
    objc_storeStrong((id *)&v22->_mediaItems, a12);
  }

  return v22;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end