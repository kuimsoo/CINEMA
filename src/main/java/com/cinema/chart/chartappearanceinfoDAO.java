package com.cinema.chart;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface chartappearanceinfoDAO {
	ArrayList<chartappearanceinfoDTO> chartappearanceinfo();
}