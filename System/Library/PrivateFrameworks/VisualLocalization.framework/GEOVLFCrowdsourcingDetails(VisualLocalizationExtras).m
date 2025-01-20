@interface GEOVLFCrowdsourcingDetails(VisualLocalizationExtras)
+ (id)_vl_createWithVLCrowdsourcingDetails:()VisualLocalizationExtras;
@end

@implementation GEOVLFCrowdsourcingDetails(VisualLocalizationExtras)

+ (id)_vl_createWithVLCrowdsourcingDetails:()VisualLocalizationExtras
{
  id v4 = a3;
  id v5 = [v4 statistics];
  uint64_t v6 = [v5 stats];

  if (v6
    && (![v4 slamTracksCount] || objc_msgSend(v4, "slamOrigin"))
    && (![v4 slamTracksCount] || objc_msgSend(v4, "slamTracks"))
    && (![v4 slamTracksCount] || objc_msgSend(v4, "slamTrackDescriptors"))
    && (![v4 slamTracksCount] || objc_msgSend(v4, "slamTrackObservations"))
    && (![v4 slamTracksCount] || objc_msgSend(v4, "slamTrackImageIndices"))
    && (![v4 slamTracksCount] || objc_msgSend(v4, "slamTracks2D"))
    && (![v4 frameCount] || objc_msgSend(v4, "perFrameVioStatusCodes"))
    && (![v4 frameCount] || objc_msgSend(v4, "perFrameVioPoses"))
    && (![v4 frameCount] || objc_msgSend(v4, "perFrameCalibrationMatrices"))
    && (![v4 frameCount] || objc_msgSend(v4, "perFrameDistortion"))
    && (id v7 = v4, [v7 resultPoseRotation])
    && (id v8 = v7, [v8 resultPoseTranslation])
    && (![v8 inliersCount] || objc_msgSend(v8, "points2D"))
    && (![v8 inliersCount] || objc_msgSend(v8, "points3D")))
  {
    id v9 = objc_alloc_init(a1);
    if (v9)
    {
      uint64_t v152 = v6;
      id v153 = v4;
      id v10 = v8;
      objc_msgSend(v9, "addSlamOrigin:", *(double *)objc_msgSend(v10, "slamOrigin"));
      id v11 = v10;
      objc_msgSend(v9, "addSlamOrigin:", *(double *)(objc_msgSend(v11, "slamOrigin") + 8));
      id v12 = v11;
      objc_msgSend(v9, "addSlamOrigin:", *(double *)(objc_msgSend(v12, "slamOrigin") + 16));
      id v13 = v12;
      objc_msgSend(v9, "addSlamOrigin:", *(double *)(objc_msgSend(v13, "slamOrigin") + 24));
      id v14 = v13;
      objc_msgSend(v9, "addSlamOrigin:", *(double *)(objc_msgSend(v14, "slamOrigin") + 32));
      id v15 = v14;
      objc_msgSend(v9, "addSlamOrigin:", *(double *)(objc_msgSend(v15, "slamOrigin") + 40));
      id v157 = v15;
      v156 = v9;
      if ([v15 slamTracksCount])
      {
        uint64_t v158 = 0;
        unint64_t v16 = 0;
        do
        {
          id v17 = objc_alloc_init(MEMORY[0x263F41CC8]);
          id v18 = v15;
          v19 = (_DWORD *)([v18 slamTracks] + 12 * v16);
          id v20 = objc_alloc_init(MEMORY[0x263F41CC0]);
          LODWORD(v21) = *v19;
          [v20 setX:v21];
          LODWORD(v22) = v19[1];
          [v20 setY:v22];
          LODWORD(v23) = v19[2];
          [v20 setZ:v23];
          [v17 setPosition:v20];

          id v24 = v18;
          uint64_t v25 = [v24 slamTrackDescriptors];
          uint64_t v26 = [v24 descriptorDimension];
          if ([v24 descriptorDimension])
          {
            unint64_t v27 = 0;
            unint64_t v28 = v25 + v26 * v16;
            do
              [v17 addDescriptors:*(unsigned __int8 *)(v28 + v27++)];
            while (v27 < [v24 descriptorDimension]);
          }
          id v29 = v24;
          uint64_t v30 = [v29 slamTrackObservations];
          uint64_t v31 = *(__int16 *)(v30 + 2 * v16);
          if (*(_WORD *)(v30 + 2 * v16))
          {
            uint64_t v32 = 2 * v158;
            uint64_t v33 = *(__int16 *)(v30 + 2 * v16);
            do
            {
              id v34 = v29;
              objc_msgSend(v17, "addObservationImageIndices:", *(__int16 *)(objc_msgSend(v34, "slamTrackImageIndices") + v32));
              id v35 = objc_alloc_init(MEMORY[0x263F41CA0]);
              id v36 = v34;
              LODWORD(v37) = *(_DWORD *)([v36 slamTracks2D] + 4 * v32);
              [v35 setX:v37];
              LODWORD(v38) = *(_DWORD *)([v36 slamTracks2D] + 4 * v32 + 4);
              [v35 setY:v38];
              [v17 addImagePositions:v35];

              v32 += 2;
              --v33;
            }
            while (v33);
          }
          v158 += v31;
          id v9 = v156;
          [v156 addSlamTracks:v17];

          ++v16;
        }
        while (v16 < [v29 slamTracksCount]);
      }
      if ([v15 frameCount])
      {
        uint64_t v39 = 0;
        uint64_t v40 = 0;
        uint64_t v41 = 0;
        unint64_t v42 = 0;
        uint64_t v43 = 88;
        uint64_t v44 = 32;
        do
        {
          id v45 = objc_alloc_init(MEMORY[0x263F41C90]);
          id v46 = v157;
          objc_msgSend(v45, "setVioStatus:", *(unsigned int *)(objc_msgSend(v46, "perFrameVioStatusCodes") + v41));
          id v47 = v46;
          LODWORD(v48) = *(_DWORD *)([v47 perFrameVioPoses] + v39);
          [v45 addVioPose:v48];
          id v49 = v47;
          LODWORD(v50) = *(_DWORD *)([v49 perFrameVioPoses] + v39 + 4);
          [v45 addVioPose:v50];
          id v51 = v49;
          LODWORD(v52) = *(_DWORD *)([v51 perFrameVioPoses] + v39 + 8);
          [v45 addVioPose:v52];
          id v53 = v51;
          LODWORD(v54) = *(_DWORD *)([v53 perFrameVioPoses] + v39 + 12);
          [v45 addVioPose:v54];
          id v55 = v53;
          LODWORD(v56) = *(_DWORD *)([v55 perFrameVioPoses] + v39 + 16);
          [v45 addVioPose:v56];
          id v57 = v55;
          LODWORD(v58) = *(_DWORD *)([v57 perFrameVioPoses] + v39 + 20);
          [v45 addVioPose:v58];
          id v59 = v57;
          LODWORD(v60) = *(_DWORD *)([v59 perFrameVioPoses] + v39 + 24);
          [v45 addVioPose:v60];
          id v61 = v59;
          LODWORD(v62) = *(_DWORD *)([v61 perFrameVioPoses] + v39 + 28);
          [v45 addVioPose:v62];
          id v63 = v61;
          LODWORD(v64) = *(_DWORD *)([v63 perFrameVioPoses] + v39 + 32);
          [v45 addVioPose:v64];
          id v65 = v63;
          LODWORD(v66) = *(_DWORD *)([v65 perFrameVioPoses] + v39 + 36);
          [v45 addVioPose:v66];
          id v67 = v65;
          LODWORD(v68) = *(_DWORD *)([v67 perFrameVioPoses] + v39 + 40);
          [v45 addVioPose:v68];
          id v69 = v67;
          LODWORD(v70) = *(_DWORD *)([v69 perFrameVioPoses] + v39 + 44);
          [v45 addVioPose:v70];
          id v71 = v69;
          LODWORD(v72) = *(_DWORD *)([v71 perFrameCalibrationMatrices] + v44 - 32);
          [v45 addCalibrationMatrix:v72];
          id v73 = v71;
          LODWORD(v74) = *(_DWORD *)([v73 perFrameCalibrationMatrices] + v44 - 28);
          [v45 addCalibrationMatrix:v74];
          id v75 = v73;
          LODWORD(v76) = *(_DWORD *)([v75 perFrameCalibrationMatrices] + v44 - 24);
          [v45 addCalibrationMatrix:v76];
          id v77 = v75;
          LODWORD(v78) = *(_DWORD *)([v77 perFrameCalibrationMatrices] + v44 - 20);
          [v45 addCalibrationMatrix:v78];
          id v79 = v77;
          LODWORD(v80) = *(_DWORD *)([v79 perFrameCalibrationMatrices] + v44 - 16);
          [v45 addCalibrationMatrix:v80];
          id v81 = v79;
          LODWORD(v82) = *(_DWORD *)([v81 perFrameCalibrationMatrices] + v44 - 12);
          [v45 addCalibrationMatrix:v82];
          id v83 = v81;
          LODWORD(v84) = *(_DWORD *)([v83 perFrameCalibrationMatrices] + v44 - 8);
          [v45 addCalibrationMatrix:v84];
          id v85 = v83;
          LODWORD(v86) = *(_DWORD *)([v85 perFrameCalibrationMatrices] + v44 - 4);
          [v45 addCalibrationMatrix:v86];
          id v87 = v85;
          LODWORD(v88) = *(_DWORD *)([v87 perFrameCalibrationMatrices] + v44);
          [v45 addCalibrationMatrix:v88];
          id v89 = v87;
          LODWORD(v90) = *(_DWORD *)([v89 perFrameDistortion] + v40);
          [v45 setRadialDistortion1:v90];
          id v91 = v89;
          LODWORD(v92) = *(_DWORD *)([v91 perFrameDistortion] + v40 + 4);
          [v45 setRadialDistortion2:v92];
          uint64_t v94 = *(void *)(v152 + 248);
          if (v94) {
            [v45 setTimestamp:*(double *)(v94 + 8 * v42)];
          }
          uint64_t v95 = *(void *)(v152 + 240);
          if (v95)
          {
            LODWORD(v93) = *(_DWORD *)(v95 + v39);
            [v45 addSlamPose:v93];
            LODWORD(v96) = *(_DWORD *)(*(void *)(v152 + 240) + v39 + 4);
            [v45 addSlamPose:v96];
            LODWORD(v97) = *(_DWORD *)(*(void *)(v152 + 240) + v39 + 8);
            [v45 addSlamPose:v97];
            LODWORD(v98) = *(_DWORD *)(*(void *)(v152 + 240) + v39 + 12);
            [v45 addSlamPose:v98];
            LODWORD(v99) = *(_DWORD *)(*(void *)(v152 + 240) + v39 + 16);
            [v45 addSlamPose:v99];
            LODWORD(v100) = *(_DWORD *)(*(void *)(v152 + 240) + v39 + 20);
            [v45 addSlamPose:v100];
            LODWORD(v101) = *(_DWORD *)(*(void *)(v152 + 240) + v39 + 24);
            [v45 addSlamPose:v101];
            LODWORD(v102) = *(_DWORD *)(*(void *)(v152 + 240) + v39 + 28);
            [v45 addSlamPose:v102];
            LODWORD(v103) = *(_DWORD *)(*(void *)(v152 + 240) + v39 + 32);
            [v45 addSlamPose:v103];
            LODWORD(v104) = *(_DWORD *)(*(void *)(v152 + 240) + v39 + 36);
            [v45 addSlamPose:v104];
            LODWORD(v105) = *(_DWORD *)(*(void *)(v152 + 240) + v39 + 40);
            [v45 addSlamPose:v105];
            LODWORD(v106) = *(_DWORD *)(*(void *)(v152 + 240) + v39 + 44);
            [v45 addSlamPose:v106];
          }
          uint64_t v107 = *(void *)(v152 + 104);
          if (v107)
          {
            v108 = (_DWORD *)(v107 + 4 * v41);
            int v109 = v108[1];
            int v110 = v108[2];
            int v111 = v108[3];
            id v112 = objc_alloc_init(MEMORY[0x263F41CE0]);
            [v112 setXCoordinate:(double)v109];
            [v112 setYCoordinate:(double)v110];
            [v112 setUncertainty:(double)v111];
            [v45 setTileId:v112];

            id v9 = v156;
          }
          uint64_t v113 = *(void *)(v152 + 120);
          if (v113)
          {
            v114 = (double *)(v113 + v43);
            double v115 = *(v114 - 10);
            double v116 = *(v114 - 9);
            double v117 = *(v114 - 8);
            double v118 = *(v114 - 7);
            double v119 = *(v114 - 6);
            double v120 = *(v114 - 5);
            double v121 = *(v114 - 4);
            double v122 = *(v114 - 3);
            double v154 = *(v114 - 2);
            double v155 = *(v114 - 1);
            double v159 = *v114;
            [v45 addResultPoseRotation:*(v114 - 11)];
            [v45 addResultPoseRotation:v115];
            [v45 addResultPoseRotation:v116];
            [v45 addResultPoseRotation:v117];
            [v45 addResultPoseRotation:v118];
            [v45 addResultPoseRotation:v119];
            [v45 addResultPoseRotation:v120];
            [v45 addResultPoseRotation:v121];
            [v45 addResultPoseRotation:v122];
            [v45 setResultTranslationX:v154];
            [v45 setResultTranslationY:v155];
            [v45 setResultTranslationZ:v159];
          }
          uint64_t v123 = *(void *)(v152 + 128);
          if (v123) {
            [v45 setResultStatus:*(unsigned int *)(v123 + v41)];
          }
          [v9 addFrameDetails:v45];

          ++v42;
          v41 += 4;
          v43 += 248;
          v40 += 8;
          v44 += 36;
          v39 += 48;
        }
        while (v42 < [v91 frameCount]);
      }
      id v124 = v157;
      objc_msgSend(v9, "addResultPoseRotation:", *(double *)objc_msgSend(v124, "resultPoseRotation"));
      id v125 = v124;
      objc_msgSend(v9, "addResultPoseRotation:", *(double *)(objc_msgSend(v125, "resultPoseRotation") + 8));
      id v126 = v125;
      objc_msgSend(v9, "addResultPoseRotation:", *(double *)(objc_msgSend(v126, "resultPoseRotation") + 16));
      id v127 = v126;
      objc_msgSend(v9, "addResultPoseRotation:", *(double *)(objc_msgSend(v127, "resultPoseRotation") + 24));
      id v128 = v127;
      objc_msgSend(v9, "addResultPoseRotation:", *(double *)(objc_msgSend(v128, "resultPoseRotation") + 32));
      id v129 = v128;
      objc_msgSend(v9, "addResultPoseRotation:", *(double *)(objc_msgSend(v129, "resultPoseRotation") + 40));
      id v130 = v129;
      objc_msgSend(v9, "addResultPoseRotation:", *(double *)(objc_msgSend(v130, "resultPoseRotation") + 48));
      id v131 = v130;
      objc_msgSend(v9, "addResultPoseRotation:", *(double *)(objc_msgSend(v131, "resultPoseRotation") + 56));
      id v132 = v131;
      objc_msgSend(v9, "addResultPoseRotation:", *(double *)(objc_msgSend(v132, "resultPoseRotation") + 64));
      id v133 = v132;
      objc_msgSend(v9, "setResultTranslationX:", *(double *)objc_msgSend(v133, "resultPoseTranslation"));
      id v134 = v133;
      objc_msgSend(v9, "setResultTranslationY:", *(double *)(objc_msgSend(v134, "resultPoseTranslation") + 8));
      id v135 = v134;
      objc_msgSend(v9, "setResultTranslationZ:", *(double *)(objc_msgSend(v135, "resultPoseTranslation") + 16));
      if ([v135 inliersCount])
      {
        uint64_t v136 = 0;
        uint64_t v137 = 0;
        unint64_t v138 = 0;
        do
        {
          id v139 = v135;
          LODWORD(v140) = *(_DWORD *)([v139 points2D] + v136);
          [v9 addInlierPoints2D:v140];
          id v141 = v139;
          LODWORD(v142) = *(_DWORD *)([v141 points2D] + v136 + 4);
          [v9 addInlierPoints2D:v142];
          id v143 = v141;
          float v144 = *(double *)([v143 points3D] + v137);
          [v9 addInlierPoints3D:v144];
          id v145 = v143;
          float v146 = *(double *)([v145 points3D] + v137 + 8);
          [v9 addInlierPoints3D:v146];
          id v147 = v145;
          float v148 = *(double *)([v147 points3D] + v137 + 16);
          [v9 addInlierPoints3D:v148];
          uint64_t v149 = *(void *)(v152 + 32);
          if (v149) {
            [v9 addSlamPtsInlierIdx:*(__int16 *)(v149 + 2 * v138)];
          }
          ++v138;
          v137 += 24;
          v136 += 8;
        }
        while (v138 < [v147 inliersCount]);
      }
      [v9 setStartFrameIdx:*(_DWORD *)(v152 + 296) & ~(*(int *)(v152 + 296) >> 31)];
      id v150 = v9;
      id v4 = v153;
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

@end